@extends('front.layouts.front_master')
@section('title') A to Z Online Shop | Category @endsection 
@section('content')




  <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
               @include('front.includes.search_item')
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>{{$cat_name->name}}</h2>
                    </div>
                 
                </div>
            </div>
                @if($cat_pro->count()>0) 
            <div class="row featured__filter">
                    @php
                    $rprice=0;
                    $sprice=0;
                    $image='';
                    $cat_key='';
                    @endphp
                    @foreach($cat_pro as $item)
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-6 mix">
                            <div class="featured_item">
                                <div class="featured__item__pic set-bg" data-setbg="">
                                  <a href="{{url('product/'.$item->ID.'/'.$item->guid)}}"> <img class="mt-4" src="{{asset('backend/products/'.$image)}}"></a>
                                    <ul class="featured__item__pic__hover">
                                        <li><a href="{{url('/wishlist/product/'.$item->ID)}}"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="{{url('product/'.$item->ID.'/'.$item->guid)}}"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="{{url('product/'.$item->ID.'/'.$item->guid)}}">{{$item->post_title}}</a></h6>
                                    <h5>@if($rprice) <del style="color:red">৳{{number_format($rprice)}}</del> @endif ৳{{number_format($sprice)}}</h5>
                                </div>
                            </div>
                      </div>    
                  @endforeach      
                </div>
                 @else 
               <h5 class="text-center">No Product Found</h5>   
                @endif 
            </div>
        </section>
    <!-- Product Section End -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
                    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
                    </script>
  <script>
    $(document).ready(function() {
        $(".alert").delay(3000).slideUp(300);
    });
  </script>
@endsection 