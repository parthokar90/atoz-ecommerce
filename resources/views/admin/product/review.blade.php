@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Review List</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Customer Product Review List</li>
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
                <h3 class="card-title">Customer Product Review List</h3>
             
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                @if($customer_review->count()==0) No Data Found @endif
                <table class="table table-bordered table-striped">
                  <thead class="bg-info">                  
                    <tr>
                      <th>Customer</th>
                      <th>Product</th>
                      <th>Review</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($customer_review as $value)
                    @if($value->comment_approved==1)
                    <tr>
                      <td>{{$value->name}} {{$value->last_name}}</td>
                      <td>{{$value->post_title}}</td>
                      <td><a style="color:#000000" href="{{url('review/list/details/'.$value->comment_ID)}}">View Review</a></td>
                      <td>Active</td>
                      <td>
                        <a style="color:#000000" href="{{url('/review/list/action/'.$value->comment_ID.'/'.'0')}}" class="btn btn-primary btn-sm"> <i class="fa fa-edit"></i> Inactive</a>
                        <a onclick="return confirm('are you sure?')" href="{{url('/review/list/delete/'.$value->comment_ID)}}" class="btn btn-danger btn-sm"> <i class="fa fa-edit"></i> Delete</a>
                      </td>
                    </tr>
                    @else 
                    <tr style="background: #db8192;">
                       <td>{{$value->name}} {{$value->last_name}}</td>
                      <td>{{$value->post_title}}</td>
                      <td><a style="color:#000000" href="{{url('review/list/details/'.$value->comment_ID)}}">View Review</a></td>
                      <td>Inactive</td>
                      <td>
                        <a href="{{url('/review/list/action/'.$value->comment_ID.'/'.'1')}}" class="btn btn-primary btn-sm"> <i class="fa fa-edit"></i>Active</a>
                        <a onclick="return confirm('are you sure?')" href="{{url('/review/list/delete/'.$value->comment_ID)}}" class="btn btn-danger btn-sm"> <i class="fa fa-edit"></i>Delete</a>
                      </td>
                    </tr>
                    @endif 
                    @endforeach
                  </tbody>
                </table>
              </div>
              <div class="d-flex justify-content-center">            
                {{$customer_review->links()}}                  
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

