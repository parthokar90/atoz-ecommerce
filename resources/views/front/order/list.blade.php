@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | Order List @endsection 
@section('content')
<style>
    table tr td, th{
        font-size: 0.8em;
    }
    .table td, .table th {
    padding: .25rem;
  
}
</style>
<!-- Page Content  -->
<div class="container p-0">
    @include('admin.includes.messages')
    <h4 class="text-center">My Orders List</h4>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">           
            <tbody>
                @php $item_id=0; @endphp
                @foreach($shop_order as $key=>$order)
                <tr class="bg-light text-center">

                    <th>
                        Order placed: 
                        {{date('d-M-Y',strtotime($order->post_date))}}
                    </th>
                    <th>
                        {{strtoupper($order->post_status)}} 
                         {{date('d-M-Y',strtotime($order->post_modified))}}
                    </th>
                    <th>
                        @if($order->post_status=='delivered')
                        @else 
                          <a style="color:#000000" title="view invoice" href="{{route('customer_ordere_cancel',$order->ID)}}">
                            Cancel /
                            Return
                        </a>
                        @endif 
                    </th>
                    <th>
                        <a style="color:#000000" title="view invoice" href="{{route('customer_ordere_edit',$order->ID)}}"> Details</i></a>                      
                    </th>
                </tr>  
                <tr class="text-center">
                    <td>
                     @php $qty=0; $cancel_qty=0; @endphp   
                    @foreach($order->orderItem as $item)
                       @php 
                       $d_img=DB::table('postmeta')
                       ->where('post_id',$item->product_id) 
                       ->where('meta_key','attached_file')
                       ->first(); 
                        $d_sku=DB::table('postmeta')
                       ->where('post_id',$item->product_id) 
                       ->where('meta_key','_sku')
                       ->first();
                       @endphp
                       @if(isset($d_img))
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$d_img->meta_value)}}">
                       @endif
                       @if(isset($d_sku))
                        {{$d_sku->meta_value}}
                       @endif 
                        @php 
                        $a_img=DB::table('posts')
                       ->where('ID',$item->product_id) 
                       ->where('meta_key','attached_file')
                       ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                       ->first(); 
                        $a_sku=DB::table('posts')
                       ->where('ID',$item->product_id) 
                       ->where('meta_key','_sku')
                       ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                       ->first(); 
                        @endphp
                        @if(isset($a_img))
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$a_img->meta_value)}}">
                       @endif
                        @if(isset($a_sku))
                        {{$a_sku->meta_value}}
                       @endif 
                    @endforeach 
                    </td>
                    <td>
                       <table style="width:100%">
                            <tr>
                                <th>Item</th>
                                <th>Attribute</th>
                                <th>Qty</th>
                            </tr>
                            @foreach($order->orderItem as $item)
                            <tr>
                                <td><b>{{$item->order_item_name}}</b></td>
                                <td>
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
                                <td>
                                    @foreach($item->orderMeta as $meta)
                                       @if($meta->meta_key=='cancel_quantity')
                                         @php $cancel_qty=$meta->meta_value; @endphp
                                        @endif 
                                        @if($meta->meta_key=='_qty')
                                          <b>{{$meta->meta_value}}<b/>
                                        @endif
                                    @endforeach 
                                </td>
                            </tr>
                            @endforeach 
                        </table>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        {{$shop_order->links()}}
    </div>
</div>
@endsection