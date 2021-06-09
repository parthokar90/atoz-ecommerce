<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
class SliderController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth:admin');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
       if($request->user()->can('manage-settings')) {
         $extraInfo=array(
        'title'=>"District List",
        'page'=>'settings'
        );
        $slider=DB::table('posts')->where('post_type','slider')->orderBy('ID','DESC')->paginate(5);
        return view('admin.slider.index',compact('slider'));
       }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
     if($request->user()->can('manage-settings')) {
         $extraInfo=array(
        'title'=>"Slider List",
        'page'=>'settings'
      );
        return view('admin.slider.create'); 
      }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         $this->validate($request,[
            'slider_img'=>'required',
        ]);
        $post_date=date('Y-m-d H:i:00');
        $post_date_gmt=date('Y-m-d H:i:s',strtotime($post_date.'+6 hour'));
        $banner=array(
            'post_title'=>'slider Image',
            'post_name'=>'slider Image',
            'post_content'=>'slider Image',
            'post_excerpt'=>'slider Image',
            'post_status'=>'publish',
            'post_author'=>Auth::user()->id,
            'post_date'=>$post_date,
            'post_date_gmt'=>$post_date_gmt,
            'to_ping'=>'',
            'pinged'=>'',
            'post_content_filtered'=>'',
            'post_type'=>'slider',
        );
         $post_id=DB::table('posts')->insertGetId($banner);
         $image = time().'.'.$request->slider_img->extension();  
         $request->slider_img->move('backend/slider/',$image);
         DB::table('postmeta')->insert([
            'post_id' =>$post_id,
            'meta_key' =>'slider_img',
            'meta_value' =>$image,
         ]);
         DB::table('postmeta')->insert([
            'post_id' =>$post_id,
            'meta_key' =>'slider_url',
            'meta_value' =>$request->slider_url,
        ]);
        session()->flash("success","Slider image has been upload successfully");
        return redirect(route('slider.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $slider=DB::table('posts')->where('post_type','slider')->orderBy('ID','DESC')->paginate(5);
        $list=DB::table('posts')->where('post_type','slider')->where('ID',$id)->first();
        $img=DB::table('postmeta')->where('post_id',$list->ID)->where('meta_key','slider_img')->first(); 
        $url=DB::table('postmeta')->where('post_id',$list->ID)->where('meta_key','slider_url')->first(); 
        $slider_image='';
        $slider_url='';
        if(isset($img)){
          $slider_image=$img->meta_value;
        }
        if(isset($url)){
          $slider_url=$url->meta_value;
        }
        return view('admin.slider.show',compact('list','slider','slider_image','slider_url'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         if($request->slider_img==''){
           $image=$request->d_image;
         }else{
         $image = time().'.'.$request->slider_img->extension();  
         $request->slider_img->move('backend/slider/',$image);
         }
         DB::table('posts')->where('post_type','slider')->where('ID',$id)->update([
           'post_status'=>$request->status
         ]);
         DB::table('postmeta')->where('post_id',$id)->where('meta_key','slider_img')->update([
            'post_id' =>$id,
            'meta_key' =>'slider_img',
            'meta_value' =>$image,
         ]);
         DB::table('postmeta')->where('post_id',$id)->where('meta_key','slider_url')->update([
            'post_id' =>$id,
            'meta_key' =>'slider_url',
            'meta_value' =>$request->slider_url,
        ]);
        session()->flash("success","Slider image has been update successfully");
        return redirect(route('slider.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       DB::table('posts')->where('ID',$id)->where('post_type','slider')->delete();
       DB::table('postmeta')->where('post_id',$id)->where('meta_key','slider_img')->delete();
       DB::table('postmeta')->where('post_id',$id)->where('meta_key','slider_img')->delete();
       session()->flash("success","Slider image has been deleted successfully");
       return redirect(route('slider.index'));
    }
}
