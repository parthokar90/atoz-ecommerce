@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | 
{{$product->post_title}}
@endsection 
@section('content')

@php
$rprice=0;
$sprice=0;
$qty=0;
$image='no-image.png';
$dimention='';
foreach ($product->productMeta as $meta):
    if($meta['meta_key']=='_regular_price'):
       $rprice=$meta['meta_value'];
    endif;

    if($meta['meta_key']=='sale_price'):
      $sprice=$meta['meta_value'];
    endif;

    if($meta['meta_key']=='default_qty'):
       $qty=$meta['meta_value'];
    endif;

    if($meta['meta_key']=='default_attribute'):
      $metavalue=json_decode($meta['meta_value']);
    endif;

    if($meta['meta_key']=='attached_file'):
      $image=$meta['meta_value'];
    endif;

    if($meta['meta_key']=='weight'):
      $dimention=$meta['meta_value'];
    endif;
endforeach;
@endphp

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{asset('bg_img/breadcrumb.jpg')}}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>{{$product->post_title}}</h2>
                        <div class="breadcrumb__option">
                            <a href="{{url('/')}}">Home</a>
                            <span>{{$product->post_title}}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
   
       <!-- Product Details Section Begin -->
    <section class="product-details spad">
    
        <div class="container">
            @if(session('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong> {{ session('error') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
    @if(session('status_error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong> {{ session('status_error') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
    @if(session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong> {{ session('success') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
      @if(session('status_success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong> {{ session('status_success') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="{{asset('backend/products/'.$image)}}" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            @foreach($gallery_images as $g)
                                <img data-imgbigurl="{{asset('backend/products/'.$g->meta_value)}}"
                                src="{{asset('backend/products/'.$g->meta_value)}}" alt="">
                            @endforeach
                
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>{{$product->post_title}}</h3>
                        <div class="product__details__rating">
                             @for($i=0;$i<$average_review;$i++)
                                    <i class="fa fa-star"></i>
                             @endfor
                            <span style="color:#000000">({{$customer_review_count}} reviews)</span>
                        </div>
                        <div class="product__details__price" style="color:#000000">৳ {{number_format($sprice)}}</div>
                        <p>{!! $product->post_content !!}</p>

                        <form  class="" action="{{route('addCart')}}" method="POST">
                         @csrf 
                         <!-- check attribute found or not -->
                              @if($attributes->count()>0)
                             <div class="mt-2">
                                <div class="d-flex flex-row align-items-center">
                               <div class="col-4 pr-0"> <label for="">Select {{ucfirst($attributes[0]->taxonomy)}}: </label> </div>
                                <div class="col-8 mt-2">
                                  <div class="checkout__input">
                                <select style="width:100%" name="" id="att_select" class="nice-select" required>
                                    <option value="">Select {{ucfirst($attributes[0]->taxonomy)}}</option>
                                    @foreach($attributes as $att)
                                      <option value="{{$att->id}}">{{$att->term}} </option>
                                    @endforeach
                                </select>
                               </div>
                             </div>
                             </div>
                             </div>


                         @if($count>0)
                          <div class="mt-2">
                               <div id="attribut-value">
                                    <div class="d-flex flex-row align-items-center">
                                        <div class="col-4">
                                            <label for="">Select Size:</label> 
                                        </div>
                                        <div class="col-8 mt-2">
                                            <select style="width:100%" class="nice-select" name="" id="att_value">
                                                <option>Select Color First</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                           </div>
                           @endif 
                           <input type="hidden" id="a_id" name="attribute_id" value="">
                            <input type="hidden" name="name" value="{{$product->post_title}}">
                            <input type="hidden" name="main_qty" value="{{$qty}}">
                            <input type="hidden" name="price" value="{{$sprice}}">
                            <input id="proid" type="hidden"  value="{{$product->ID}}">
                         
                            @else 
                            <input type="hidden" name="id" value="{{$product->ID}}">
                            <input type="hidden" name="name" value="{{$product->post_title}}">
                            <input type="hidden" name="main_qty" value="{{$qty}}">
                            <input type="hidden" name="price" value="{{$sprice}}">
                          @endif 
                          <!-- end check -->
                           <div  class="d-flex flex-row align-items-center">
                                        <div class="col-md-4 col-4">
                                            <label for=""><b>Quantity:</b></label> 
                                        </div>
                                        <div class="col-md-8 col-8 mt-2">
                                               <div class="quantity">
                                                    <div class="pro-qty">
                                                        <input  step="1" min="1" max="" name="quantity" type="number" value="1">
                                                    </div>
                                                </div>
                                        </div>
                           </div>


                          <div class="row mt-2">
                            <div class="col-md-10 col-6">
                                         <button style="width:100%" type="submit"  class="site-btn">ADD TO CART</button>
                            </div>
                            <div class="col-md-2 col-6">
                                 <a  href="{{url('/wishlist/product/'.$product->ID)}}" class="heart-icon">
                                        <span style="color:#000000" class="icon_heart_alt"></span>
                                    </a>
                            </div>
                          </div>



                        </form>
                        <ul>
                            <!-- <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li> -->
                           @if($dimention!='')<li><b>Weight</b> <span>{{$dimention}}</span></li>@endif 
                            <!-- <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li> -->
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>({{$customer_review_count}})</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Description</h6>
                                    <p>{!! $product->post_content !!}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>{!! $product->post_excerpt !!}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                   <h6>Products Review</h6>
                                 
                                  
                                  
                                 
                                   @if(Auth::check())
                                   <form method="post" action="{{route('user_product_review')}}">
                                    @csrf 
                                     <input type="hidden" name="product_id" value="{{Crypt::encrypt($product->ID)}}">
                                    <div class="form-group">
                                       <label for="">Your Rating</label><br>
                                       <input name="review" value="1" type="radio" name=""><i style="color:gold" class="fa fa-star"></i>
                                       <input name="review" value="2" type="radio" name=""><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i>
                                       <input name="review" value="3" type="radio" name=""><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i>
                                       <input name="review" value="4" type="radio" name=""><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i>
                                       <input name="review" value="5" type="radio" name=""><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i><i style="color:gold" class="fa fa-star"></i>
                                    </div>
                                     <div class="form-group">
                                        <label for="">Message</label>
                                        <textarea maxlength="100" name="message" autocomplete="off" class="form-control" rows="5" cols="5" maxlength=250 required></textarea>
                                     </div>
                                    <button type="submit" class="site-btn">Submit Review</button>
                                  </form>  
                                  @endif 
                                  @if($customer_review->count()>0)
                                  <!-- review list -->
                                     <div class="card mt-2">
                                          @foreach($customer_review as $key =>$review)
                                          @php 
                                          $rating=DB::table('wp_commentmeta')
                                          ->where('comment_id',$review->comment_ID) 
                                          ->where('meta_key','customer_review') 
                                          ->get();
                                          @endphp
                           
                                            <hr> 
                                            
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <img width="40px" height="40px" src="{{asset('assets/front/user/user.jpg')}}" class="img img-rounded img-fluid"/>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <p>
                                                            <strong> {{$review->name}}</strong>
                                                             @foreach($rating as $star)
                                                                @for($i=0;$i<$star->meta_value;$i++)
                                                                    <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                                                @endfor 
                                                             @endforeach
                                                       </p>
                                                        <p>{{$review->comment_content}}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            @endforeach 
                                        </div>
                                  <!-- review list -->
                                  @endif 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">

                        @php
                        $rprice=0;
                        $sprice=0;
                        $img='';
                        @endphp
                        @foreach($product_related as $related)
                        @php
                        $product_info=DB::table('postmeta')->where('post_id',$related->ID)->get();
                        @endphp
                        @foreach($product_info as $info)
                        @if($info->meta_key=='regular_price') @php $rprice=$info->meta_value @endphp
                        @endif
                        @if($info->meta_key=='sale_price') @php $sprice=$info->meta_value @endphp
                        @endif
                        @if($info->meta_key=='attached_file')
                        @php $img=$info->meta_value @endphp
                        @endif
                        @endforeach

                <div class="col-lg-3 col-md-4 col-sm-6 col-6">
                    <div class="product__item">
                        <div class="product__item__pic" data-setbg="">
                         <a href="{{url('product/'.$related->ID.'/'.$related->guid)}}"><img src="{{asset('backend/products/'.$img)}}"></a>
                            <ul class="product__item__pic__hover">
                                <li><a href="{{url('/wishlist/product/'.$related->ID)}}"><i class="fa fa-heart"></i></a></li>
                                <li><a href="{{url('product/'.$related->ID.'/'.$related->guid)}}"><i class="fa fa-eye"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="{{url('product/'.$related->ID.'/'.$related->guid)}}">{{$related->post_title}}</a></h6>
                            <h5>@if($rprice) <del style="color:red">৳{{$rprice}}</del>@endif ৳{{$sprice}}</h5>
                        </div>
                    </div>
                </div>
             @endforeach
        
            
            </div>
        </div>
    </section>
<!-- Related Product Section End -->

<!-- script start -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
                    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
 </script>
  <script>
    $(document).ready(function() {
        $(".alert").delay(3000).slideUp(300);
$("#att_select").on('change', function() {
      var id = $("#att_select").val();
      var proid = $("#proid").val();
      $.ajax({
        type: "GET",
        url: "{{url('att')}}" + "/" + id+"/"+proid,
        dataType: "json",
        success: function(response) {
            if (response!=0){
                 $('#attribut-value').show();
                var schema_one = '';
                    schema_one +='<option>Select</option>'; 
                $.each(response, function(i, item) { 
                    schema_one += '<option value="' + item.term_id+ '">' + item.term + '</option>';
                    document.getElementById('a_id').value=item.product_parent
                });
                $('#att_value').html(schema_one);

            }else{
           var id = $("#att_select").val();
            var proids = $("#proid").val();
            $.ajax({
                    type: "GET",
                    url: "{{url('only')}}" + "/" + id+"/"+proids,
                    dataType: "json",
                    success: function(response) {
                    var schema_one = '';
                    $.each(response, function(i, item) {
                        document.getElementById('a_id').value=item.product_parent 
                    });
                    },
                    error: function(response) {
                    console.log(response);
                    }
                })
            }
        },
        error: function(response) {
          console.log(response);
        }
      })
    });


     $("#att_value").on('change', function() {
      var id = $("#att_value").val();
            var proidd = $("#proid").val();
      $.ajax({
        type: "GET",
        url: "{{url('atts')}}" + "/" + id+"/"+proidd,
        dataType: "json",
        success: function(response) {
          var schema_one = '';
          $.each(response, function(i, item) {
            document.getElementById('a_id').value=item.product_parent 
          });
        },
        error: function(response) {
          console.log(response);
        }
      })
    });

    });
  </script>
<!-- script end -->
@endsection