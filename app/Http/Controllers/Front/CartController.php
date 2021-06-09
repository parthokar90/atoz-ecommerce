<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Cart;
use auth;
use Mail;
use Redirect;
use Session;
use App\Http\Requests\CheckoutValidateRequest;

class CartController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function cart(Request $request) {
           $session_id=0;
           $coupon_type='';
           $discount_amount=0;
           if(Auth::check()){
            $cart_user_count=DB::table('user_cart')
            ->where('user_id',auth()->user()->id)
            ->sum('quantity');    
            $total_order=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price');   
            $session_id=auth()->user()->id;   
            $info = DB::table('user_cart')->where('user_id',auth()->user()->id)->orderBy('cart_id','DESC')->get();
            $user_info = DB::table('usermeta')
            ->where('user_id', auth()->user()->id)
            ->get();   
             }else{
               session_start();
               $session_id=session_id();  
               $user_info = [];
               $info = Cart::getContent();
               $total_order=Cart::getTotal();
               $cart_user_count=Cart::getTotalquantity();
             }
             if($cart_user_count==0){
               DB::table('sessions')->where('session_key',$session_id)->delete();
             }
            //coupon code start
              $discount_code=DB::table('sessions')
              ->where('session_key',$session_id)
              ->where('session_expiry','>=',date('Y-m-d'))
              ->first();
              if(isset($discount_code->session_code)){
                $discount_type=DB::table('coupons')
               ->where('coupon_code',$discount_code->session_code)
               ->where('status',1)
               ->where('expire_date','>=',date('Y-m-d'))
               ->first();
                if(isset($discount_type->coupon_type)){
                   if($discount_type->coupon_type==2){
                     $discount_amount=$total_order/100*$discount_type->coupon_amount;
                   }else{
                       $discount_amount=$discount_type->coupon_amount;
                   }
                }
              }
            //coupon code end    
        return view('front.cart', compact('info', 'user_info','discount_code','total_order','coupon_type','discount_amount','cart_user_count'));
    }

      public function DiscountCoupon(Request $request){
             if(Auth::check()){ 
             $session_id=auth()->user()->id;
             }else{
               session_start();
               $session_id=session_id();
             }
            // coupon code start 
              $code=$request->code;
              $count=DB::table('coupons')
              ->where('coupon_code',$code)
              ->where('status',1)
              ->where('expire_date','>=',date('Y-m-d'))
              ->count();
              if($count>0){
                $data=DB::table('coupons')
                ->where('coupon_code',$code)
                ->where('status',1)
                ->where('expire_date','>=',date('Y-m-d'))
                ->select('coupon_code','coupon_amount','coupon_type','expire_date')
                ->first(); 
                }else{
                    $data=0;  
                    session()->flash('status_error_update', 'Coupon code not exists'); 
                    return back(); 
                }
              // coupon code start 
               if(isset($_POST['c_s'])){

               if(isset($data->coupon_type)){
                DB::table('sessions')->where('session_key',$session_id)->delete();
                DB::table('sessions')->insert([
                'session_key'=>$session_id,
                'session_code'=>$data->coupon_code,
                'session_value'=>$data->coupon_type,
                'session_expiry'=>$data->expire_date,
              ]);
              }
             }  
            return redirect()->route('cart');
      }

      public function cartCheckout(){
           $discount_code=0;
           $discount_amount=0;
           $first_name='';
           $last_name='';
           $address='';
           $phone='';
           $email='';
           $user_district='';
           $city='';
           $zip='';
          if(Auth::check()){
            $cart_user_count=DB::table('user_cart')
            ->where('user_id',auth()->user()->id)
            ->sum('quantity');  
           $user_info=DB::table('users')->where('id',auth()->user()->id)->first();
           $first_name=auth()->user()->name;
           $last_name=auth()->user()->last_name;
           $address=DB::table('usermeta')->where('user_id',auth()->user()->id)->where('meta_key','address_one')->first();
           $phone=DB::table('usermeta')->where('user_id',auth()->user()->id)->where('meta_key','phone')->first();
           $user_district=DB::table('usermeta')->where('user_id',auth()->user()->id)->where('meta_key','district')->first();
           $city=DB::table('usermeta')->where('user_id',auth()->user()->id)->where('meta_key','city')->first();
           $zip=DB::table('usermeta')->where('user_id',auth()->user()->id)->where('meta_key','zip')->first();
           $email=$user_info->email;
           if(isset($address)){
              $address=$address->meta_value;
            }
            if(isset($phone)){
                $phone=$phone->meta_value;
            }  
            if(isset($user_district)){
                $user_district=$user_district->meta_value;
            }  
            if(isset($city)){
                $city=$city->meta_value;
            }  
            if(isset($zip)){
                $zip=$zip->meta_value;
            }       
           $info = DB::table('user_cart')->where('user_id',auth()->user()->id)->orderBy('cart_id','DESC')->get();
           $total_order=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); 
           $session_id=auth()->user()->id; 
          }else{
              session_start();
              $session_id=session_id();
              $cart_user_count=Cart::getTotalquantity();
              $info = Cart::getContent();
              $total_order=Cart::getTotal();
                 $first_name=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','first_name')->first();
                 $last_name=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','last_name')->first();
                 $address=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','address_one')->first();
                 $phone=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','phone')->first();
                 $email=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','user_email')->first();
                 $user_district=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','district')->first();
                 $city=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','city')->first();
                 $zip=DB::table('usermeta')->where('user_id',$session_id)->where('meta_key','zip')->first();
                if(isset($first_name)){
                    $first_name=$first_name->meta_value;
                 }
                if(isset($last_name)){
                    $last_name=$last_name->meta_value;
                 }
                if(isset($address)){
                    $address=$address->meta_value;
                 }
                if(isset($phone)){
                    $phone=$phone->meta_value;
                 }
                if(isset($email)){
                    $email=$email->meta_value;
                 } 
                if(isset($user_district)){
                  $user_district=$user_district->meta_value;
                }  
                if(isset($city)){
                    $city=$city->meta_value;
                }  
                if(isset($zip)){
                    $zip=$zip->meta_value;
                }          
             }
            //coupon code start
              $discount_code=DB::table('sessions')
              ->where('session_key',$session_id)
              ->first();
              if(isset($discount_code->session_code)){
                $discount_type=DB::table('coupons')
               ->where('coupon_code',$discount_code->session_code)
               ->where('status',1)
               ->where('expire_date','>=',date('Y-m-d'))
               ->first();
                if(isset($discount_type->coupon_type)){
              
                   if($discount_type->coupon_type==2){
                      $discount_amount=$total_order/100*$discount_type->coupon_amount;
                   }else{
                      $discount_amount=$discount_type->coupon_amount;
                   }
                }
              }
            //coupon code end 

            //district 
             $district = DB::table('term_taxonomy')->where('taxonomy', 'district')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->select('terms.term_id', 'terms.name as district')
                ->get();

             $ctty=DB::table('term_taxonomy')->where('taxonomy', 'city')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->select('terms.term_id', 'terms.name as ct')
                ->get();
            //district
          return view('front.user_checkout',compact('cart_user_count','info','total_order','discount_amount',
          'discount_code','user_district','first_name','last_name','address','phone','email','district','city','zip','ctty'));
      }

    public function cart_new() {
        $info = Cart::getContent();
        if (Auth::check()) {
            $user_info = DB::table('usermeta')
                    ->where('user_id', auth()->user()->id)
                    ->get();
        } else {
            $user_info = [];
        }
        $district = DB::table('term_taxonomy')->where('taxonomy', 'district')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->select('terms.term_id', 'terms.name as district')
                ->get();
        return view('front.cart_new', compact('info', 'user_info', 'district'));
    }

    public function districtCityAjax($id) {
        $data = DB::table('term_taxonomy')->where(['taxonomy' => 'city', 'parent' => $id])
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->select('terms.name as city_name', 'terms.term_id')
                ->get();

        $charge=DB::table('term_taxonomy')->where('term_id',$id)->where('taxonomy','district')->get();
        $option_amount=DB::table('options')->first();
        if(isset($option_amount)){
          $amount=$option_amount->option_value;
        }else{
             $amount=0;
        }
        return response()->json(['data'=>$data,'charge'=>$charge,'amount'=>$amount]);
    }

    public function districtCityPostcode($id) {
        $data = DB::table('term_taxonomy')->where(['taxonomy' => 'postcode', 'parent' => $id])
                ->select('description as zip')
                ->get();
        return response()->json($data);
    }

    public function addCart(Request $request) {
            if($request->quantity==0){
                    return back()->with('error', 'Quantity must be greater than 0');
                    exit();
            }
            if($request->attribute_id!=0){
            $stock=DB::table('postmeta')
            ->where('post_id',$request->attribute_id)
            ->where('meta_key','attribute_stock')
            ->select('meta_value')
            ->first(); 
            if(isset($stock)){

        
            if ($request->quantity > $stock->meta_value) {
                return back()->with('error', 'Quantity not Exists');
                exit();
            }
             if($stock->meta_value==0){
                return back()->with('error', 'Out of stock');
                exit();
             }
            }
                }

            else{
              $stock=DB::table('postmeta')
            ->where('post_id',$request->id)
            ->where('meta_key','default_qty')
            ->select('meta_value')
            ->first();  
                 if(isset($stock)){
            if ($request->quantity > $stock->meta_value) {
                return back()->with('error', 'Quantity not Exists');
                exit();
            }
            if($stock->meta_value==0){
                return back()->with('error', 'Out of stock');
                exit();
             }
            }
            }
             if(isset($stock)){
            if($request->attribute_id!=0){
                $parent=$request->attribute_id;
            }else{
                $parent=$request->id; 
            }
            }else{
                return back()->with('error', 'Out of stock');
                exit();
            }

            Cart::add(array(
                array(
                    'id' => $parent,
                    'price' => $request->price,
                    'quantity' => $request->quantity,
                    'name' => $request->name,
                ),
               )
            );

            if(Auth::check()){
              $user_id=auth()->user()->id;
              $count=DB::table('user_cart')
              ->where('user_id',$user_id)
              ->where('id',$parent)
              ->count();
              if($count>0){
               $old_qty=DB::table('user_cart')
              ->where('user_id',$user_id)
              ->where('id',$parent)
              ->select('quantity')
              ->first();

               $old_price=DB::table('user_cart')
              ->where('user_id',$user_id)
              ->where('id',$parent)
              ->select('price')
              ->first();

              $updateQty=$old_qty->quantity+$request->quantity;
              $updatePrice=$updateQty*$request->price;

              DB::table('user_cart')
              ->where('user_id',$user_id)
              ->where('id',$parent)
              ->update([
                'user_id'=>$user_id,
                'id'=>$parent,
                'price' => $updatePrice,
                'actual_price' => $request->price,
                'quantity' => $updateQty,
                'name' => $request->name,
              ]);
              }else{
              DB::table('user_cart')->insert([
                'user_id'=>$user_id,
                'id'=>$parent,
                'price' => $request->price*$request->quantity,
                'actual_price' => $request->price,
                'quantity' => $request->quantity,
                'name' => $request->name,
              ]);
            }
            }
         
           return redirect()->back()->with('success', 'Product added in Cart');
      }

    public function index() {
        //
    }

    public function checkout(CheckoutValidateRequest $request) {
        $dist_name=DB::table('term_taxonomy')
         ->where('taxonomy','district')
         ->where('terms.term_id',$request->state)
        ->join('terms','terms.term_id','=', 'term_taxonomy.term_id')
        ->first();
        $city_name=DB::table('term_taxonomy')
         ->where('taxonomy','city')
         ->where('terms.term_id',$request->city)
        ->join('terms','terms.term_id','=', 'term_taxonomy.term_id')
        ->first();
        $zip_code=$request->zip;
        $deliver_condition_amount=DB::table('options')->first();
        if(isset($deliver_condition_amount)){
            $op_amount=$deliver_condition_amount->option_value;
        }else{
            $op_amount=0; 
        }

        if(Auth::check())
        { 
        $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); 
        }
        else
        {
        $totak_price=Cart::getTotal(); 
        }      
        if($totak_price>=$op_amount){
              $dcharge=0; 
         }else{
              if ($request->paymentMethod == 'DeliveryChargeOnly') {
            $dcharge = 0;
        } else {
            $delivery_charge = DB::table('term_taxonomy')->where('term_id',$request->state)->where('taxonomy','district')->select('description')->first();
            $dcharge = $delivery_charge->description;
        }

       }

        if($request->coupon_taka==''){
           $coupon_taka=0;
        }else{
            $coupon_taka=$request->coupon_taka;
        }


        if (\Auth::check()) {
            $id = auth()->user()->id;
        } else {
            session_start(); 
            $id = session_id();
        }
        $user_address = DB::table('usermeta')->where('user_id',$id)->where('meta_key','address_one')->count();
        $user_district = DB::table('usermeta')->where('user_id',$id)->where('meta_key','district')->count();
        $user_city = DB::table('usermeta')->where('user_id',$id)->where('meta_key','city')->count();
        $user_postcode = DB::table('usermeta')->where('user_id',$id)->where('meta_key','zip')->count();

        $first=DB::table('usermeta')->where('user_id',$id)->where('meta_key','first_name')->count();
        $last=DB::table('usermeta')->where('user_id',$id)->where('meta_key','last_name')->count();
        $phone=DB::table('usermeta')->where('user_id',$id)->where('meta_key','phone')->count();
        $user_email=DB::table('usermeta')->where('user_id',$id)->where('meta_key','user_email')->count();
        DB::table('users')->where('id',$id)->update([
          'name' =>$request->first_name,
          'last_name' =>$request->last_name,
          'email' =>$request->email,
        ]);

        if ($user_address== 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'address_one',
                'meta_value' => $request->address_one,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'address_one')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'address_one',
                'meta_value' => $request->address_one,
            ]);
        }


        if ($user_district == 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'district',
                'meta_value' => $request->state,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key','district')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'district',
                'meta_value' => $request->state,
            ]);
        }
        if ($user_city == 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'city',
                'meta_value' => $request->city,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'city')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'city',
                'meta_value' => $request->city,
            ]);
        }

        if ($user_postcode == 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'zip',
                'meta_value' => $request->zip,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'zip')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'zip',
                'meta_value' => $request->zip,
            ]);
        }



        if ($first==0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'first_name',
                'meta_value' => $request->first_name,
            ]);
        } else {
            DB::table('usermeta')->where('user_id',$id)->where('meta_key','first_name')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'first_name',
                'meta_value' => $request->first_name,
            ]);
        }

        if ($last==0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'last_name',
                'meta_value' => $request->last_name,
            ]);
        } else {
            DB::table('usermeta')->where('user_id',$id)->where('meta_key','last_name')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'last_name',
                'meta_value' => $request->last_name,
            ]);
        }

        if ($phone==0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'phone',
                'meta_value' => $request->phone,
            ]);
        } else {
            DB::table('usermeta')->where('user_id',$id)->where('meta_key','phone')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'phone',
                'meta_value' => $request->phone,
            ]);
        }

        if ($user_email==0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'user_email',
                'meta_value' => $request->email,
            ]);
        } else {
            DB::table('usermeta')->where('user_id',$id)->where('meta_key','user_email')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'user_email',
                'meta_value' => $request->email,
            ]);
        }



        $state = DB::table('terms')->where('term_id', $request->state)->select('name')->first();
        $city = DB::table('terms')->where('term_id', $request->city)->select('name')->first();
        $info = Cart::getContent();
        $post_date = date('Y-m-d 0:0:0)');
        $post_date_gmt = date('Y-m-d H:i:s', strtotime('+6 hour'));
        $order = array(
            'post_title' => 'Order' . date('Y-m-d H:i:s'),
            'post_status' => 'on-hold',
            'post_name' => 'order-' . date('M-d-Y-Hm'),
            'post_password' => 'order_1247',
            'post_date' => $post_date,
            'post_date_gmt' => $post_date_gmt,
            'post_type' => 'shop_order',
            'post_author' => $id,
        );
        $order_id = DB::table('posts')->insertGetId($order);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'first_name',
            'meta_value' => $request->first_name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'last_name',
            'meta_value' => $request->last_name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'address_one',
            'meta_value' => $request->address_one,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'address_two',
            'meta_value' => $request->address_one,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'phone',
            'meta_value' => $request->phone,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'email',
            'meta_value' => $request->email,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'country',
            'meta_value' => $request->country,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'state',
            'meta_value' => $state->name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'city',
            'meta_value' => $city->name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'zip',
            'meta_value' => $request->zip,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_customer_user',
            'meta_value' => $id,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_postcode',
            'meta_value' => $request->zip,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_company',
            'meta_value' => $request->_billing_company,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_last_name',
            'meta_value' => $request->lastName,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_first_name',
            'meta_value' => $request->firstName,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'payment_method',
            'meta_value' => $request->paymentMethod,
        );
        DB::table('postmeta')->insert($order_post);
       
        if(Auth::check()) {
           $info = DB::table('user_cart')->where('user_id',auth()->user()->id)->get();
        }else{
             $info = Cart::getContent();
        }
        //     foreach ($info as  $value) {
        //        $order_item=array(
        //         'order_item_name'=>$value->name,
        //         'order_item_type'=>'line-item',
        //         'order_id'=>$order_id,
        //     );
        //     DB::table('order_items')->insert($order_item); 
        //    }
        foreach ($info as $key=>$item) {            
           //if product attribute not found then stock minus from default stock quantity 
             $pro = DB::table('postmeta')->where('post_id',$item->id)->where('meta_key','default_qty')->get();
                    foreach ($pro as $pros) {
                        $ac_qty = $pros->meta_value;
                        $customer_qty = $item->quantity;
                        $tot_qty = $ac_qty - $customer_qty;
                        DB::table('postmeta')->where('post_id',$item->id)->where('meta_key','default_qty')->update([
                            'meta_value' => $tot_qty,
                        ]);
               }

                 $pro_two = DB::table('postmeta')->where('post_id',$item->id)->where('meta_key','attribute_stock')->get();
                    foreach ($pro_two as $pros) {
                        $ac_qty = $pros->meta_value;
                        $customer_qty = $item->quantity;
                        $tot_qty = $ac_qty - $customer_qty;
                        DB::table('postmeta')->where('post_id',$item->id)->where('meta_key','attribute_stock')->update([
                            'meta_value' => $tot_qty,
                        ]);
               }
               //if user login then price calculate from db otherwise session
               if(Auth::check()){
                   $tot_pri=$item->quantity * $item->actual_price;
               }else{
                  $tot_pri=$item->quantity * $item->price;
               }
              $check_id=DB::table('posts')
              ->where('ID',$item->id)
              ->select('ID','post_parent')
              ->first(); 

              if($check_id->post_parent==0){ $p_id=$check_id->ID; }  else{ $p_id=$check_id->post_parent;}
         
            $order_item = array(
                'order_item_name' => $item->name,
                'order_item_type' => 'line-item',
                'order_id' => $order_id,
                'product_id' => $item->id,
                'product_parent' => $p_id
            );
            $order_item_id = DB::table('order_items')->insertGetId($order_item);

      

            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_tax_class',
                'meta_value' => '',
                'customer_id' => $id,
                'order_id' => $order_id,
                'order_date' => date('Y-m-d'),
                'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);


            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_qty',
                'meta_value' => $item->quantity,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_product_id',
                'meta_value' => $item->id,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_variation_id',
                'meta_value' => '',
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_subtotal',
                'meta_value' => $tot_pri,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_total',
                'meta_value' => $tot_pri,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_subtotal_tax',
                'meta_value' => '',
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_tax',
                'meta_value' => '',
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            // $_line_tax_data=date('Y-m-d H:i:s');
            $_line_tax_data_gmt = date('Y-m-d H:i:s', strtotime('+6 hour'));
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_tax_data',
                'meta_value' => $_line_tax_data_gmt,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'delivery_charge',
                'meta_value' => $dcharge,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);

            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'coupon_code',
                'meta_value' => $request->promo_code,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);

             $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'coupon_taka',
                'meta_value' => $coupon_taka,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);

              $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'attribute_parent',
                'meta_value' => $item->id,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            // if($request->paymentMethod=='DeliveryChargeOnly'){
            //    $order_item_details=array(
            //     'order_item_id'=>$order_item_id,
            //     'meta_key'=>'customer_pay_delivery_charge',
            //     'meta_value'=>$dcharge,
            //     'order_id'=>$order_id,
            //     'customer_id'=>$id,
            //     'order_date'=>date('Y-m-d'),
            //   );
            //  DB::table('order_itemmeta')->insert($order_item_details);
            // }


             $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'user_district',
                'meta_value' => $dist_name->name,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);

             $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'user_city',
                'meta_value' => $city_name->name,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);

            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'user_zip',
                'meta_value' => $zip_code,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
                   'product_id' => $item->id,
                'product_parent' => $p_id
            );
            DB::table('order_itemmeta')->insert($order_item_details);


        }
        if(Auth::check()){
          DB::table('user_cart')->where('user_id',auth()->user()->id)->delete();
          DB::table('sessions')->where('session_key',$id)->delete();
        }else{
          Cart::clear();
            DB::table('sessions')->where('session_key',$id)->delete();
        }
        
        // $name = $request->first_name;
        // $email = $request->email;
        // $subject='Order Confirmation';
        // Mail::send('mail', ['name' => $name, 'order_id' => $order_id], function($message) use ($email, $subject) {
        //      $message->from('order@bigshotstyle.com', 'Bigshot');
        //      $message->to($email)->subject($subject);
        // });
        return redirect()->route('order.success');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request) {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request) {
        for($i=0;$i<count($request->product_id);$i++){ 
          $product_id=$request->product_id[$i];
           $qty=$request->quantity[$i]; 
           
           
           $default_pro=DB::table('postmeta')
           ->where('post_id',$request->product_id[$i])
           ->where('meta_key','default_qty')
           ->first();

           if(isset($default_pro)){
               $ac_qty_default=$default_pro->meta_value;
               if($qty>$ac_qty_default){
                return back()->with('status_error_update', 'Quantity not exists');
               }
           }

            $attribute_pro=DB::table('postmeta')
           ->where('post_id',$request->product_id[$i])
           ->where('meta_key','attribute_stock')
           ->first();

          if(isset($attribute_pro)){
               $ac_qty_att=$attribute_pro->meta_value;
               if($qty>$ac_qty_att){
                return back()->with('status_error_update', 'Quantity not exists');
               }
           }
            Cart::update($product_id, array(
            'quantity' => array(
                'relative' => false,
                'value' =>   $qty
            ),
            ));
            if(Auth::check()){
              $user_id=auth()->user()->id;
              $current_price=DB::table('user_cart')
              ->where('user_id',$user_id)
              ->where('id',$product_id)
              ->select('actual_price')
              ->first();
              DB::table('user_cart')
              ->where('user_id',$user_id)
              ->where('id',$product_id)
              ->update([
                 'quantity'=>$qty,
                 'price'=>$qty*$current_price->actual_price,
                 'actual_price'=>$current_price->actual_price,
              ]);
             }
        }
         return back()->with('status','Item quantity has been update');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        //
    }

    public function remove($id) {
        Cart::remove($id);
        if(Auth::check()){
        $user_id=auth()->user()->id;
        DB::table('user_cart')
              ->where('user_id',$user_id)
              ->where('id',$id)
              ->delete();
        }
        return redirect(route('cart'))->with('status', 'Item deleted from cart');
    }

        //promo code ajax
    public function applyPromocode($code){

    
      $count=DB::table('coupons')
       ->where('coupon_code',$code)
       ->where('status',1)
       ->where('expire_date','>=',date('Y-m-d'))
       ->select('coupon_code','coupon_amount','coupon_type')
       ->count();
       if($count>0){
       $data=DB::table('coupons')
       ->where('coupon_code',$code)
       ->where('status',1)
       ->where('expire_date','>=',date('Y-m-d'))
       ->select('coupon_code','coupon_amount','coupon_type')
       ->get(); 
       }else{
           $data=0;
       }
        dd(  $data);
    }

}
