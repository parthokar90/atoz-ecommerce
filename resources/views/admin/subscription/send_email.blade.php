@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Email Subscription</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Email Subscription</li>
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
                <h3 class="card-title">Email Subscription</h3>
              </div>
              <div class="card-body">
                <form method="post" action="{{route('subscribe_mail_send')}}">
                  @csrf 
                     <div class="form-group">
                        <label>To</label>
                        <input class="form-control" type="text" name="email" value="{{$list->meta_value}}" readonly required>
                     </div>

                     <div class="form-group">
                        <label>Subject</label>
                        <input class="form-control" type="text" name="subject" required>
                     </div>

                     <div class="form-group">
                        <label>Message</label>
                        <textarea name="message" class="form-control" cols="5" rows="5" required></textarea>
                     </div>
                     <button type="submit" class="btn btn-success">Send Mail</button>
                </form>
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