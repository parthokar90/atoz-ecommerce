@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Customer Review</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Customer Product Review</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <div class="row"> 
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Customer Product Review</h3>
               </div>
              <!-- /.card-header -->
              <div class="card-body">
               

               Customer: {{$customer_review->post_title}}<br>
               Product: {{$customer_review->post_title}}<br>
               Review: {{$customer_review->comment_content}}<br><br><br>

               @if($customer_review->comment_approved==1)
                        <a style="color:#000000" href="{{url('/review/list/action/'.$customer_review->comment_ID.'/'.'0')}}" class="btn btn-primary btn-sm"> <i class="fa fa-edit"></i> Inactive</a>
                        <a onclick="return confirm('are you sure?')" href="{{url('/review/list/delete/'.$customer_review->comment_ID)}}" class="btn btn-danger btn-sm"> <i class="fa fa-edit"></i> Delete</a>
               @else 
                        <a style="color:#000000" href="{{url('/review/list/action/'.$customer_review->comment_ID.'/'.'1')}}" class="btn btn-primary btn-sm"> <i class="fa fa-edit"></i>Active</a>
                        <a onclick="return confirm('are you sure?')" href="{{url('/review/list/delete/'.$customer_review->comment_ID)}}" class="btn btn-danger btn-sm"> <i class="fa fa-edit"></i> Delete</a>   
               @endif 
              </div>
              <div class="d-flex justify-content-center">                        
              </div>  
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
@endsection

