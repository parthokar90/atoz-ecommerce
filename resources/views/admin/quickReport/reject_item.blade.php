@extends('admin.layouts.master')
@section('content')

<div class="content-wrapper" style="min-height: 1203.6px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			    @include('admin.includes.messages')
			<div class="row mb-2">
				<div class="col-sm-6">

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
	
	</div>
</div>
@endsection