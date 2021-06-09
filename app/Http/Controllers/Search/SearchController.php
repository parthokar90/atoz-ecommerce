<?php

namespace App\Http\Controllers\Search;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\front\Post;



class SearchController extends Controller
{

    public function SearchItem(Request $request)
    {
       $products=[];
       if($request->cat_id==''){
           $q = $request->search;
           $products=Post::where('post_type','product')
           ->where('post_status','publish')
           ->where('post_title', 'like', '%' .$q. '%')
           ->get();
       }else{
           return redirect()->route('pro_cat',$request->cat_id);
       }
      
       return view('front.search',compact('products'));
    }
}
