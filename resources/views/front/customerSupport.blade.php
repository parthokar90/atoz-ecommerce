@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | Support @endsection 
@section('content')

<style>
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #495057;
    background-color: #fff;
    border-color:  #ffffff;
    border: 0px;
}
.nav-tabs .nav-link {
    border: 0px solid #ffffff;
}
</style>

<div id="content" class="container p-0 mb-2">
      @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong> {{ session('success') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                @endif

                @if(session('error'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong> {{ session('error') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                @endif
    <h4 class="text-center">
      Customer Support 
    </h4>

      <ul class="nav nav-pills">
        <li class="nav-item">
          <a style="background:#D23457;color:#ffffff;" class="nav-link active ml-4" data-toggle="pill" href="#general">General Enquiries</a>
        </li>
        <li class="nav-item">
          <a style="background:#D23457;color:#ffffff;" class="nav-link ml-4" data-toggle="pill" href="#return">Request cancel/return</a>
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div class="tab-pane container active" id="general">
              @if($admin_reply->count()>0)
               <table class="table">
                      <thead>
                        <tr>
                          <th>Subject</th>
                          <th>Admin Reply</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($admin_reply as $reply)
                        <tr>
                          <td>{{$reply->post_title}}</td>
                          <td>{{$reply->post_excerpt}}</td> 
                        </tr>
                        @endforeach 
                      </tbody>
                  </table>
                  @endif 
                    <form action=" {{route('genarelQuiry')}} " method="POST">
                        @csrf
                        <div class="h4 mt-2">General Enquiries Form</div>
                       
                        <div class="form-group">
                          <label class=" control-label">Subject</label>
                          <div class="">
                            <input class="form-control" type="text" name="subject" placeholder="Subject" required>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class=" control-label">Your Message</label>
                          <div class="">
                            <textarea maxlength="50" class="form-control"  type="text" name="message" placeholder="Your Message" required></textarea>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="">
                            <button type="submit" class="site-btn">Submit</button>
                          </div>
                        </div>
                      </form>
              </div>

           <div class="tab-pane container fade" id="return">
                <h4 class="text-center mb-4">Request cancel/return Form</h4>
                <nav class="nav nav-tabs nav-justified">
                  <a style="color:#000000" class="nav-item nav-link active" data-toggle="tab" href="#full">Full Order?</a>
                  <a style="color:#000000" class="nav-item nav-link" data-toggle="tab" href="#partial">Partial Order?</a>  
                </nav> 
                      <div class="tab-content">
                          <div class="tab-pane container active" id="full">
                              <form method="POST" action="{{route('s_cancel')}}">
                              @csrf
                              <input type="hidden" name="cancel_option" value="full">
                              <div id="order_id" class="form-group">
                                <label>Select Order Id <span style="color:red">*</span> </label>
                                <select id="customer_order_id" class="form-control" name="customer_order_id">
                                  <option value="">Chose Order Id</option>
                                  @foreach($order_list as $single_order)
                                    <option value="{{$single_order->order_id}}">{{$single_order->order_id}}</option>
                                  @endforeach 
                                </select>
                              </div>
                              <div class="red">
                                <div class="form-group">
                                  <label class=" control-label">
                                    Reason for Cancellation <span style="color:red">*</span>
                                  </label>
                                  <textarea maxlength="50" class="form-control" type="text" name="c_reason"  placeholder="Reason for Cancellation" required></textarea>
                                </div>
                              </div>                          
                              <button type="submit" class="site-btn">Submit</button>
                              </form>
                        </div>

                          <div class="tab-pane container fade" id="partial">
                              
                            <form method="POST" action="{{route('s_cancel')}}" target="_blank">
                                @csrf
                                <input type="hidden" name="cancel_option" value="partials">
                                <div id="order_id" class="form-group">
                                  <label>Select Order Id <span style="color:red">*</span> </label>
                                  <select id="pc" class="form-control" name="customer_order_id">
                                    <option value="">Chose Order Id</option>
                                    @foreach($order_list as $single_order)
                                      <option value="{{$single_order->order_id}}">{{$single_order->order_id}}</option>
                                    @endforeach 
                                  </select>
                                </div>
                              </form>


                        </div>
                  </div>
           </div>
      </div>
</div>


<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script>
 $('#pc').on('change', function(){
    $(this).closest('form').submit();
    $('#pc').prop('selectedIndex', 0);
});
</script>
@endsection