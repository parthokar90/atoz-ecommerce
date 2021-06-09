@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | Cancel @endsection 
@section('content')
<style>
    table tr td{
        font-size: 0.8em;
    }
    .table td, .table th{
        padding: 10px 5px
    }
    ::placeholder{
        font-size: 12px;
    }
    @media (max-width: 767px) {
    .productChanQty{
        padding: 0px;
        min-width: 20px;
    }
}
</style>
<div class="container p-0">
    @include('admin.includes.messages')
    <h4 class="text-center">Select item you want to cancel or return</h4>

    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr style="background:#e7e7e7">
                    <td>Order placed
                        {{date('d-m-Y',strtotime($order->post_date))}}</td>
                    <td>{{$order->post_status}}
                        {{date('d-m-Y',strtotime($order->post_modified))}}
                    </td>
                 
                    <td></td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                 @php $qty=0; $cancel_qty=0; $acq=0; @endphp  
            @foreach($order_item as $item)
                <tr>
                    <td style="border:none">
                     <b>{{$item->order_item_name}}</b><br>
                      @php 
                       $d_img=DB::table('postmeta')
                       ->where('post_id',$item->product_id) 
                       ->where('meta_key','attached_file')
                       ->first(); 
                       @endphp
                       @if(isset($d_img))
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$d_img->meta_value)}}">
                       @endif</br>
                        @php 
                        $a_img=DB::table('posts')
                       ->where('ID',$item->product_id) 
                       ->where('meta_key','attached_file')
                       ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                       ->first(); 
                        @endphp
                        @if(isset($a_img))
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$a_img->meta_value)}}">
                       @endif</br> 
                       @php 
                                $list_att=DB::table('postmeta')->where('post_id',$item->product_id)
                                ->where('meta_key','attribute')->get(); 
                                @endphp
                                  @foreach($list_att as $a)
                                  @php $data_att=json_decode($a->meta_value); @endphp 
                                  @foreach($data_att as $da)
                                   <b>{{strtoupper($da->term)}}</b>
                                    @endforeach 
                                  @endforeach 
                    </td>
                       @foreach($item->orderMeta as $meta)
                                       @if($meta->meta_key=='cancel_quantity')
                                         @php $cancel_qty=$meta->meta_value; @endphp
                                        @endif 
                                        @if($meta->meta_key=='_qty')
                                          @php $acq=$meta->meta_value; @endphp
                                        @endif
                        @endforeach 

                    <td style="border:0px solid #ffffff">{{$acq}} pcs</td>
               
                      
                   
                        <form method="post" action="{{route('customer_order_cancel_item')}}">
                            @csrf 
                            <td style="border:0px solid #ffffff"> 
                                   @if($acq>0)
                                    <select style="width:50%" name="request_qty" id="request_qty" class="form-control productChanQty">
                                        @for($i=1;$i<=$acq;$i++)
                                        <option value="{{$i}}" class="p-0">{{$i}}</option>
                                        @endfor
                                    </select>
                                    @endif 
                                    <input type="hidden" class="form-control" name="cancel_item_id" value="{{$item->order_item_id}}">
                                    <input type="hidden" class="form-control" name="cancel_product_id" value="{{$item->product_id}}">
                                    <input type="hidden" class="form-control" name="cancel_order_id" value="{{$item->order_id}}">
                        
                            </td>
                            <td style="border:0px solid #ffffff"> 
                              @if($acq>0)   
                            <button onclick="return confirm('Are you sure want to cancel this item??')" class="btn btn-danger btn-sm"><span style="color:white"> <i class="fa fa-times"></i> </span></button>
                            @endif 
                            </td>
                           @php 
                           $tot_qty=DB::table('order_itemmeta')
                           ->where('order_id',$item->order_id) 
                           ->where('meta_key','_qty')
                           ->sum('meta_value'); 
                            $tot_qty_cancel=DB::table('order_itemmeta')
                           ->where('order_id',$item->order_id) 
                           ->where('meta_key','cancel_quantity')
                           ->sum('meta_value'); 
                           $acc_qty=$tot_qty-$tot_qty_cancel;
                           @endphp
                             <input type="hidden" name="stock_order_qty" value="{{$acc_qty}}">
                        </form>
            </tr>
            @endforeach 
            </tbody>
        </table>


@if($order->post_status=='cancelled')
 @else 
    <form method="post" action="{{route('customer_order_cancel_item_full')}}">
        @csrf 

        <div class="form-group">
            <label>Reason for return/cancel</label>
            <textarea cols="5" rows="5" class="form-control" name="reason" autocomplete="off" required></textarea>
        </div>
        <input type="hidden" name="o_id" value="{{$order->ID}}">
        <button onclick="return confirm('Are you sure want to cancel full order??')" class="btn btn-danger btn-sm mb-3"><span style="color:white">Cancel Full Order</span></button>
    </form>  
    @endif 
    </div>
</div>
@endsection