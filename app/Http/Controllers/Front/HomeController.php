<?php

namespace App\Http\Controllers\Front;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\front\Post;
use DB;

class HomeController extends Controller
{
    public function index(Request $request){
        // product 
         $categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('cat_status',1)
        ->select('term_taxonomy.*','terms.name','terms.status','cat_image','terms.term_id as cat_id')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get();

         $products=Post::where('post_type','product')
        ->where('post_status','publish')
        ->orderBy('ID','DESC')
        ->get();

        $fproducts=Post::where('post_type','product')
        ->join('term_relationships', 'posts.ID', '=', 'term_relationships.object_id')
        ->join('terms','terms.term_id','=','term_relationships.term_taxonomy_id')
        ->where('post_status','publish')
        ->where('post_mime_type','featured')
        ->groupBy('ID')
        ->orderBy('ID','DESC')
        ->get();
 

         $sproducts=Post::where('post_type','slider')
        ->where('post_status','publish')
        ->orderBy('ID','DESC')
        ->get();
 

        $parent_cat = DB::table('term_relationships')
        ->join('terms','terms.term_id','=','term_relationships.term_taxonomy_id')
        ->join('posts', 'posts.ID', '=', 'term_relationships.object_id')
        ->where('terms.status',1)
        ->where('posts.post_mime_type','featured')
        ->select('terms.term_id','terms.name as cat','terms.status')
        ->limit(4)
        ->get();

        $top_rated_product=DB::SELECT("SELECT guid,post_title,ID,wp_commentmeta.comment_id,wp_comments.comment_post_ID,SUM(meta_value) as total_review 
        FROM wp_commentmeta 
        JOIN wp_comments ON wp_comments.comment_ID=wp_commentmeta.comment_id 
        JOIN posts ON posts.ID=wp_comments.comment_post_ID 
        where meta_key='customer_review' 
        GROUP by comment_post_ID 
        ORDER by total_review DESC LIMIT 8");
       

    	return view('front.home',compact('categories','products','parent_cat','fproducts','sproducts','top_rated_product'));
    }

    public function catItemProduct($id){
      $cat_name=DB::table('terms')->where('term_id',$id)->first();
      $cat_pro=Post::where('post_type','product')
      ->join('term_relationships','term_relationships.object_id','=','posts.ID')  
      ->where('post_status','publish')
      ->where('term_taxonomy_id',$id)
      ->get();
      return view('front.category_product',compact('cat_pro','cat_name'));
    }
}
