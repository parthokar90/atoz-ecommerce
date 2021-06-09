@extends('admin.layouts.master')
@section('content')

<div class="content-wrapper" style="min-height: 1203.6px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			    @include('admin.includes.messages')
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Reject Item List</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<a href="{{route('admin.home')}}">Home</a>
						</li>
						<li class="breadcrumb-item active">Reject Item</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- Main content -->
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2"></div>
		</div>
		<!-- /.container-fluid -->
		<div class="s002">
			<div class="d-flex font-weight-bold justify-content-center h2 mb-3">Search Reject Item</div>
			<div class="d-flex justify-content-center">
			<form class="form-inline" method="post" action="{{route('reject.item.search.data')}}" >
				@csrf() 
				<div class="form-group mb-2">
				<label for="depart" class="mr-2">Start Date </label>
				<input class="form-control datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date"/>
				</div>
				<div class="form-group mx-sm-3 mb-2">
				<label for="return" class="mr-2">End Date </label>
				<input class="form-control datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date"/>
				</div>
				<button type="submit" class="btn btn-primary mb-2">SEARCH</button>
			</form>
			</div>
           </div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container">
				<div class="col-12 text-center font-weight-bold mb-2">
							Search date {{$startDate}} to {{$endDate}}
				</div>
				<div class="card">
					<div class="card-header">
					</div>
					<div class="card-body">
						
						<div class="table-responsive-sm">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="center">SKU</th>
										<th class="right">Item</th>
										<th class="right">Attribute</th>
										<th class="right">Qty</th>
										<th class="right">Reject Date</th>
									</tr>
								</thead>
								<tbody>
									@php $total_qty=0; @endphp
									@foreach($data as $item)
									 @php 
									 $check_id=DB::table('posts')
									->where('ID',$item->post_id)
									->select('ID','post_parent')
									->first();
									 @endphp 
									@if(isset($check_id))
											@if($check_id->post_parent==0) 
											@php $p_id=$check_id->ID; @endphp  
											@else 
											@php $p_id=$check_id->post_parent; @endphp 
											@endif
									@endif
									<tr>
										<td class="center">
											@php $sku=DB::table('postmeta')
											->where('post_id',$p_id) 
											->where('meta_key','_sku')
											->first(); 
											@endphp
											@if(isset($sku)) {{$sku->meta_value}} @endif
										</td>
										<td class="right">
                                          @php $name=DB::table('posts')->where('ID',$p_id)->first(); @endphp @if(isset($name)) @php $pro_name=$name->post_title; @endphp @endif {{$pro_name}}
										</td>

										<td>
											@php 
														$lists=DB::table('postmeta')
														->where('post_id',$item->post_id)
														->where('meta_key','attribute')
														->select('meta_value','post_id')
														->first();
														@endphp
														@if(isset($lists))
														 @php $attribute=json_decode($lists->meta_value); @endphp
														   @foreach($attribute as $att)
                                                                        {{$att->taxonomy}} :
                                                                        {{$att->term}}     
                                                           @endforeach 
														@endif 
										</td>
										<td>
											@php 
											$qty=DB::table('postmeta')->where('post_id',$item->post_id)
											->where('meta_key','reject_qty')->first(); 
											@endphp
											@if(isset($qty)) @php $qtyy=$qty->meta_value; @endphp @endif
											{{$qtyy}} @php $total_qty+=$qtyy; @endphp
										</td>
										<td>
											
											{{$item->meta_value}}
										</td>
									</tr>
									@endforeach 
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-4 col-sm-5"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="box bg-primary">
							<!-- <i class="fa fa-lemon ml-1"></i> -->
							<h3 class="text-center">{{$total_qty}}</h3>
							<p class="lead text-center font-weight-bold">Total Quantity</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
	<!-- /.content -->
	<!--  </div> -->
</div>
@endsection