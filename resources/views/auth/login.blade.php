
@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | Login @endsection 
@section('content')

<style>
    .nav-tabs .nav-link{
        border: 0;
        border-bottom: 4px solid rgb(240, 245, 247);
    }
    .nav-tabs .nav-link.active{
        color: #495057;
        background-color: #fff;

        border-color: rgb(0, 152, 211) !important;
    }
    .form-control{
        background-color: rgb(240, 245, 247);
    }
    .facbook{
        background: #2450AF;
    }
    ::placeholder{
        font-size: 14px
    }
    .orBorder{
        background: black;
        width: 100%;
        height: 1px;
    }
    .orDiv{
        position: absolute;
        padding: 0px 18px;
        background-color: rgb(255, 255, 255);
        color: black;
        font-size: 14px;
        font-weight: 400;
        left: 45%;
        margin-top: -13px;
    }
</style>
<div class="d-flex justify-content-center ">
   
<div class="col-md-4 col-12 mb-4">


    <nav id="myTab" class="nav nav-tabs nav-justified border-0 nt-3">
        <a class="nav-item nav-link active font-weight-bold text-dark w-50"
        data-toggle="tab" href="#home">Log In</a>
        <a class="nav-item nav-link font-weight-bold w-50 text-dark"
        data-toggle="tab" href="#menu2">Sign Up</a>

        <!-- <a class="nav-item nav-link disabled" data-toggle="tab" href="#menu3"></a> -->
    </nav>
    <div class="tab-content" style="overflow-y: hidden;">
        <div id="home" class="tab-pane active">              

            <div class="">
                <div class="card-body p-0">
                    <form action="{{ route('login') }}" method="POST">
                        @csrf
                        <div class="form-group mt-2 input-group-lg">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" class="form-control @error('email') is-invalid @enderror" placeholder="Email address" value="{{ old('email') }}" required autocomplete="email" autofocus>
                            @error('email')

                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror

                        </div>
                        <div class="form-group input-group-lg">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" class="form-control @error('password') is-invalid @enderror" placeholder="***********" required autocomplete="current-password">
                            @error('password')

                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror

                        </div>
                        <!-- <p class="pull-left m-t-20"><a  href="{{ route('password.request') }}">Forgot password?</a></p> -->
                        <button style="background: #0098D3; color:#ffffff" type="submit" class="btn btn-block login-btn mb-4 font-weight-bold" >Log in</button>
                    </form>
                    <!-- <div class="d-flex flex-column">
                        <div class="or text-center mb-3">
                            <div class="border-1 orBorder"></div>
                            <div class="orDiv">Or</div>
                        </div>
                        <a class=" facbook btn btn-info text-center font-weight-bold text-decoration-none text-white" href="{{ url('/auth/redirect/facebook') }}">
                            <div class=""> <img src="{{asset('assets/common/images/fb.png')}}" class="img float-left" style="height: 33px;width: 40px"> Facbook</div></a>
                            <a href="{{ url('/auth/redirect/google') }}" class="btn btn-outline-dark mt-3 text-center font-weight-bold text-decoration-none">
                                <div class="google "><img src="{{asset('assets/common/images/google-logo.png')}}" class="float-left" width="40" height="30"> Google</div>
                            </a>
                        </div> -->

                     <!--    <a href="{{ url('/auth/redirect/facebook') }}" style="width:100%; background: #2450AF;color:#ffffff;" class="btn btn-success"><img src="https://img.icons8.com/fluent/48/000000/facebook-new.png" width="40" height="30"> Facebook</a>
                        <a href="{{ url('/auth/redirect/google') }}" class="btn btn-default mt-2 btn-block"><img src="https://img.icons8.com/color/48/000000/google-logo.png" width="40" height="30"> Google </a> -->


                    </div>
                </div>
            </div>
            <div id="menu2" class="tab-pane fade">
                <div class="">
                    <div class="card-body p-0">
                        <form method="POST" action="{{ route('user_registration') }}">
                            @csrf


                            <div class="d-flex mt-2">   
                                <div class="col-md-6 pl-0">
                                    <div class="form-group input-group-lg">
                                        <label>First Name</label>
                                        <input aria-label="Sizing example input" id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" placeholder="First name" aria-describedby="inputGroup-sizing-lg">
                                        @error('name')

                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror

                                    </div>
                                </div>


                                <div class="col-md-6 pr-0">
                                    <div class="form-group input-group-lg">
                                        <label for="email">Last Name</label>
                                        <input id="name" type="text" class="form-control @error('last_name') is-invalid @enderror" name="last_name" value="{{ old('last_name') }}" aria-label="Sizing example input" required autocomplete="last_name" placeholder="Last name" >
                                        @error('name')

                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror

                                    </div>
                                </div>
                            </div>

                            <div class="form-group input-group-lg">
                                <label for="email">{{ __('E-Mail Address') }}</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="Email">
                                @error('email')

                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror

                            </div>
                            <div class="form-group input-group-lg">
                                <label for="password">{{ __('Password') }}</label>
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Password">
                                @error('password')

                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror

                            </div>
                            <div class="form-group input-group-lg">
                                <label for="password-confirm">{{ __('Confirm Password') }}</label>
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Confirm Password">
                                @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>

                            <!-- <div class="form-group input-group-lg">
                                <label for="password-confirm">Image</label>
                                <input id="image" type="file" class="form-control" name="image" autocomplete="new-password">
                            </div> -->

                            <input type="checkbox" id="checkme" name="checkme" value="Terms & condition and Privacy policy" required>
                            <label for="vehicle1"><a style="color:#000000" href="{{url('/terms&conditions')}}">Terms & condition  </a>and <a style="color:#000000" href="{{url('/privacy')}}"> Privacy policy</a></label>
                            <button style="background: #0098D3; color:#ffffff" type="submit" class="btn btn-block login-btn mb-4" id="sendNewSms">{{ __('Sign Up') }}</button>
                            <!-- <input type="submit" id="submit_sign" value="Submit" disabled /> -->
                        </form>
                          <!-- <div class="d-flex flex-column">
                        <div class="or text-center mb-3">
                            <div class="border-1 orBorder"></div>
                            <div class="orDiv">Or</div>
                        </div>
                        <a class=" facbook btn btn-info text-center font-weight-bold text-decoration-none text-white" href="{{ url('/auth/redirect/facebook') }}">
                             <div class=""> <img src="{{asset('assets/common/images/fb.png')}}" class="img float-left" style="height: 33px;width: 40px"> Facbook</div></a>
                        </a>
                            <a href="{{ url('/auth/redirect/google') }}" class="btn btn-outline-dark mt-3 text-center font-weight-bold text-decoration-none">
                                <div class="google "><img src="https://img.icons8.com/color/48/000000/google-logo.png" class="float-left" width="40" height="30"> Google</div>
                            </a>
                        </div> -->
                    </div>
                </div>
            </div>
            <div id="menu1" class="tab-pane fade"></div>
            <div id="menu3" class="tab-pane fade"></div>
        </div>
    </div>
</div>
@endsection