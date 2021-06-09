@extends('front.layouts.front_master')
@section('title') A to Z Online Shop | Home @endsection 
@section('content')
<style>
.carousel-control-prev-icon,
.carousel-control-next-icon {
  height: 60px;
  width: 60px;
  background-size: 43%, 100%;
  border-radius: 50%;
  border: 1px solid #ffffff;
  background-color: #000000;
}

.carousel-control-next-icon:after
{
  content: '';
  font-size: 55px;
  color: red;
}

.carousel-control-prev-icon:after {
  content: '';
  font-size: 55px;
  color: red;
}
.list-group[aria-expanded="true"]{
     background-color: black !important;
  border-color: #aed248;

}
</style>
  <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                  <div class="col-lg-3">
                       <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All Category</span>
                        </div>

                    <div class="list-group list-group-root well">
                    @php 
                        $child1=[];   $child2=[];
                        $tags = DB::table('term_taxonomy')
                        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                        ->where('term_taxonomy.taxonomy', 'product_cat')
                        ->where('terms.term_group','0')
                        ->where('terms.status',1)
                        ->select('term_taxonomy.*', 'terms.name', 'terms.status')
                        ->orderBy('term_taxonomy.count','DESC')
                        ->get();
                    @endphp

                    @foreach($tags as $tag)

                        @php 
                        $child1 = DB::table('term_taxonomy')
                        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                        ->where('term_taxonomy.taxonomy', 'product_cat')
                        ->where('terms.term_group',$tag->term_id)
                        ->where('terms.status',1)
                        ->select('term_taxonomy.*', 'terms.name', 'terms.status')
                        ->orderBy('term_taxonomy.count')
                        ->get();
                        @endphp
                        <!-- parent start -->
                        @if($child1->count()>0)
                           
                            <a style="color:#000000;" href="#item-{{$tag->term_id}}" class="list-group-item" data-toggle="collapse" style="background:red">
                                <i class="glyphicon glyphicon-chevron-right"></i>
                                {{$tag->name}} 
                                <span class="pull-right"> 
                                   @if($child1->count()>0) 
                                     <i class="fa fa-chevron-right"></i> 
                                   @endif 
                                </span>
                            </a>
                            @else 
                            <a style="color:#000000" href="{{url('product/category/item/'.$tag->term_id)}}" class="list-group-item">
                                <i class="glyphicon glyphicon-chevron-right"></i>{{$tag->name}}
                            </a>
                        @endif 
                        <!-- parent end -->

                       <!-- child one start -->
                        @foreach($child1 as $child)
                            <div class="list-group collapse" id="item-{{$tag->term_id}}">
                                <a style="color:#000000" href="{{url('product/category/item/'.$child->term_id)}}" class="list-group-item">
                                <i class="glyphicon glyphicon-chevron-right"></i><span style="color:#D23457">{{$child->name}}</span> 
                                </a>
                            </div>

                             @php 
                             $child2 = DB::table('term_taxonomy')
                             ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                             ->where('term_taxonomy.taxonomy', 'product_cat')
                             ->where('terms.term_group',$child->term_id)
                             ->where('terms.status',1)
                             ->select('term_taxonomy.*', 'terms.name', 'terms.status')
                             ->orderBy('term_taxonomy.count')
                             ->get();
                             @endphp

                        @endforeach     
                       <!-- child one end -->

                        <!-- child two start -->
                            @foreach($child2 as $child3)
                               <div class="list-group collapse" id="item-3-2"> 
                                <a style="color:#000000" href="#item-3-2" class="list-group-item" data-toggle="collapse">
                                <i class="glyphicon glyphicon-chevron-right"></i>{{$child3->name}}
                                </a>
                              </div>
                            @endforeach  
                        <!-- child two start -->
                    @endforeach
                    </div>
                  </div>
                 <div class="col-lg-9">
                       <!-- search -->
                        @include('front.includes.search_item')
                       <!-- search -->                       
                    <div id="carouselExampleIndicators" class="carousel slide mt-5" data-ride="carousel">
                        <div class="carousel-inner">
                        @php
                        $image='';
                        $url='';
                        $cat_key='';
                        @endphp
                        @foreach($sproducts as $item)
                        @foreach ($item->productMeta as $meta)
                            @if($meta['meta_key']=='slider_img')
                            @php
                                $image=$meta['meta_value'];
                            @endphp
                            @endif

                            @if($meta['meta_key']=='slider_url')
                            @php
                                $url=$meta['meta_value'];
                            @endphp
                            @endif
                        @endforeach 
                    <div class="carousel-item {{ $loop->first ? ' active' : '' }}">
                    <img width="870px" height="431px" class="d-block w-100" src="{{asset('backend/slider/'.$image)}}" alt="Third slide">
                      <div class="carousel-caption">
                          <a href="{{$url}}" class="primary-btn">SHOP NOW</a>
                      </div>
                    </div>
                  @endforeach
                </div>
                <a  class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    @foreach($categories as $item)
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="{{asset('backend/category/'.$item->cat_image)}}">
                            <h5><a href="{{url('product/category/item/'.$item->term_id)}}">{{$item->name}}</a></h5>
                        </div>
                    </div>
                   @endforeach
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->


    <!-- latest product -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Latest Product</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                    @php
                    $rprice=0;
                    $sprice=0;
                    $image='';
                    $cat_key='';
                    @endphp
                    @foreach($products as $item)
                        @foreach ($item->productMeta as $meta)
                        
                           @if($meta['meta_key']=='regular_price')
                             @php
                               $rprice=$meta['meta_value'];
                             @endphp
                          @endif

                       @if($meta['meta_key']=='sale_price')
                          @php
                             $sprice=$meta['meta_value'];
                          @endphp
                       @endif

                       @if($meta['meta_key']=='attached_file')
                         @php
                           $image=$meta['meta_value'];
                         @endphp
                       @endif
                    @endforeach 
                    <div class="col-lg-3 col-md-4 col-sm-6 col-6">
                            <div class="featured_item1">
                                <div class="featured__item__pic set-bg" data-setbg="">
                                   <a href="{{url('product/'.$item->ID.'/'.$item->guid)}}"> <img class="mt-4" src="{{asset('backend/products/'.$image)}}"></a>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="{{url('product/'.$item->ID.'/'.$item->guid)}}">{{$item->post_title}}</a></h6>
                                    <h5>@if($rprice) <del style="color:red">৳{{number_format($rprice)}}</del> @endif ৳{{number_format($sprice)}}</h5>
                                </div>
                            </div>
                    </div> 
                @endforeach     
            </div>
        </div>
    </section>
    <!-- latest product end -->

   
    <!-- top rated product -->
        <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Top Rated Product</h2>
                    </div>
                 
                </div>
            </div>
            <div class="row featured__filter">
                    @php
                    $rprice=0;
                    $sprice=0;
                    $image='';
                    $cat_key='';
                    @endphp
                    @foreach($top_rated_product as $item)
                       @php $postmeta=DB::table('postmeta')->where('post_id',$item->ID)->get(); @endphp
                       @foreach($postmeta as $meta) 
                            @if($meta->meta_key=='attached_file')
                                @php
                                $image=$meta->meta_value;
                                @endphp
                            @endif
                            
                            @if($meta->meta_key=='regular_price')
                              @php
                                $rprice=$meta->meta_value;
                              @endphp
                            @endif

                            @if($meta->meta_key=='sale_price')
                                @php
                                    $sprice=$meta->meta_value;
                                @endphp
                            @endif
                       @endforeach
                    <div class="col-lg-3 col-md-4 col-sm-6 col-6">
                            <div class="featured_item">
                                <div class="featured__item__pic set-bg" data-setbg="">
                                  <a href="{{url('product/'.$item->ID.'/'.$item->guid)}}"> <img class="mt-4" src="{{asset('backend/products/'.$image)}}"></a>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="{{url('product/'.$item->ID.'/'.$item->guid)}}">{{$item->post_title}}</a></h6>
                                    <h5>@if($rprice) <del style="color:red">৳{{number_format($rprice)}}</del> @endif ৳{{number_format($sprice)}}</h5>
                                </div>
                            </div>
                    </div>    
                @endforeach     
            </div>
        </div>
    </section>
    <!-- top rated product -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                 
                </div>
            </div>
            <div class="row featured__filter">
                    @php
                    $rprice=0;
                    $sprice=0;
                    $image='';
                    $cat_key='';
                    @endphp
                    @foreach($fproducts as $item)
                        @foreach ($item->productMeta as $meta)
                        
                           @if($meta['meta_key']=='regular_price')
                             @php
                               $rprice=$meta['meta_value'];
                             @endphp
                          @endif

                       @if($meta['meta_key']=='sale_price')
                          @php
                             $sprice=$meta['meta_value'];
                          @endphp
                       @endif

                       @if($meta['meta_key']=='attached_file')
                         @php
                           $image=$meta['meta_value'];
                         @endphp
                       @endif

                    @endforeach 
                    @php $string = preg_replace('/\s+/', '', $item->name); @endphp
                    <div class="col-lg-3 col-md-4 col-sm-6 col-6 mix {{$string}}">
                            <div class="featured_item">
                                <div class="featured__item__pic set-bg" data-setbg="">
                                  <a href="{{url('product/'.$item->ID.'/'.$item->guid)}}"> <img class="mt-4" src="{{asset('backend/products/'.$image)}}"></a>
                                  
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="{{url('product/'.$item->ID.'/'.$item->guid)}}">{{$item->post_title}}</a></h6>
                                    <h5>@if($rprice) <del style="color:red">৳{{number_format($rprice)}}</del> @endif ৳{{number_format($sprice)}}</h5>
                                </div>
                            </div>
                    </div>    
                @endforeach     
            </div>
        </div>
    </section>
@endsection 