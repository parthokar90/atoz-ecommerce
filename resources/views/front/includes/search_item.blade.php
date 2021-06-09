<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<style> 
.select2-container--default .select2-selection--single {
    background-color: #fff;
    border: 1px solid #aaa;
    border-radius: 0px; 
}
.select2-container .select2-selection--single {
    box-sizing: border-box;
    cursor: pointer;
    display: block;
    height: 38px;
    user-select: none;
    -webkit-user-select: none;
}
.select2-container--default .select2-selection--single .select2-selection__rendered {
    color: #444;
    line-height: 33px;
}
.select2-container--default .select2-selection--single .select2-selection__arrow {
    height: 34px;
    position: absolute;
    top: 1px;
    right: 1px;
    width: 20px;
}
</style>  
  <form method="get" action="{{url('search/item')}}">
                            <div class="input-group">
                                <div class="input-group-btn search-panel">  
                                @php  $child1=[]; $child2=[]; @endphp
                                 <select name="cat_id" class=" js-example-basic-single">
                                    <option value="">Select Category</option>
                                        @php 
                                        $tags = DB::table('term_taxonomy')
                                        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                                        ->where('term_taxonomy.taxonomy', 'product_cat')
                                        ->where('terms.term_group','0')
                                        ->where('terms.status',1)
                                        ->select('term_taxonomy.*', 'terms.name', 'terms.status')
                                        ->get();
                                        @endphp
                                          @foreach($tags as $tag)
                                            <option value="{{$tag->term_id}}">{{strtoupper($tag->name)}}</option>
                                               @php 
                                                $child1 = DB::table('term_taxonomy')
                                                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                                                ->where('term_taxonomy.taxonomy', 'product_cat')
                                                ->where('terms.term_group',$tag->term_id)
                                                ->where('terms.status',1)
                                                ->select('term_taxonomy.*', 'terms.name', 'terms.status')
                                                ->get();
                                                 @endphp
                                                    @foreach($child1 as $child)
                                                        <option value="{{$child->term_id}}">{{$child->name}}</option>
                                                        @php 
                                                        $child2 = DB::table('term_taxonomy')
                                                        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                                                        ->where('term_taxonomy.taxonomy', 'product_cat')
                                                        ->where('terms.term_group',$child->term_id)
                                                        ->where('terms.status',1)
                                                        ->select('term_taxonomy.*', 'terms.name', 'terms.status')
                                                        ->get();
                                                        @endphp
                                                    @endforeach

                                                    @foreach($child2 as $child3) 
                                                      <option value="{{$child3->term_id}}">{{$child3->name}}</option>
                                                    @endforeach

                                        @endforeach
                                    </select>
                                    
                                </div>
                                <input type="text" class="form-control" name="search" placeholder="Search here...">
                                <span class="input-group-btn">
                                    <button style="padding: 5px 15px 8px;" type="submit" class="site-btn btn-sm"><i style="padding-top: 7px" class="fa fa-search"></i></button>
                                </span>
                            </div>
                         </form>
                         <script src="https://code.jquery.com/jquery-3.4.1.min.js"
                    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>                  
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    $('.js-example-basic-single').select2();
</script> 