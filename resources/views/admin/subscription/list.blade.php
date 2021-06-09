@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Mail Subscription List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Mail Subscription List</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        @include('admin.includes.messages')
        <div class="row">
           
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Mail Subscription List</h3>
              </div>
              <div class="card-body">
              <table class="table table-bordered table-striped table">
                 <thead class="bg-info">                 
                    <tr>
                      <th>Email</th>
                      <!-- <th>Action</th> -->
                    </tr>
                  </thead>

                  <tbody>
                     @foreach($list as $mail)
                      <tr>
                        <th>{{$mail->meta_value}}</th>
                        <!-- <th><a class="btn btn-success btn-sm" href="{{route('send_subscribe_email',$mail->umeta_id)}}">Send mail</a></th> -->
                      </tr>
                     @endforeach 
                  </tbody>
                  {{$list->links()}}
                </table>
              </div>
              <div class="d-flex justify-content-center">              
              </div>  
            </div>
          </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection