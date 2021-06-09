@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | Password @endsection 
@section('content')
<div class="container">
  <div class="row">
     <div class="col-md-6">
           <div class="form-group">
              <form action="{{route('password.update',$user->id)}}" method="post" enctype="multipart/form-data">
              {{ csrf_field() }}
               <label for="n_password">New Password</label>
                  <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="n_password" required autocomplete="new-password" placeholder="New Password">
                   <button type="submit" class="site-btn float-left mt-3 mb-3">Update Password</button>
              </form>
           </div>
     </div>
   </div>
</div>
@endsection