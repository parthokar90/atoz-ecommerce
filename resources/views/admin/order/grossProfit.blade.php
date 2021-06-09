@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Gross Profit</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Gross Profit</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form method="post" action="{{route('order.grossProfit.report')}}">
        @csrf 
        <div class="inner-form ml-5">
          
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="depart" type="date" placeholder="29 Aug 2018" />

          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="return" type="date" placeholder="30 Aug 2018" />
          </div>
        
          <div class="input-field fifth-wrap">
            <button class="btn-search" type="button">SEARCH</button>
          </div>
        </div>
      </form>
    </div>

       
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <div class="card">

          <div class="card-header"> 
            
          </div>

          <div class="card-body">
            

            <div class="table-responsive-sm">
              <table class="table table-striped">
                <thead>
                  <tr>
                  <th class="center">Date</th>
                  <th>Order Id</th>
                  <th>Description</th>

                  <th class="right">Quantity</th>
                  <th class="center">Sales amount</th>
                  <th class="right">Cost</th>
                  <th class="right">Gross Profit</th>
    
                  </tr>
                </thead>

                <tbody>
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong">Origin License</td>
                  <td class="left">Extended License</td>

                  <td class="right">$999,00</td>
                  <td class="center">1</td>
                  <td class="right">$999,00</td>
                  <td class="right">$999,00</td>


                  <tr>
                  <td class="center">2</td>
                  <td class="left">Custom Services</td>
                  <td class="left">Instalation and Customization (cost per hour)</td>

                  <td class="right">$150,00</td>
                  <td class="center">20</td>
                  <td class="right">$3.000,00</td>
                  <td class="right">$3.000,00</td>
         
                  </tr>

                  <tr>
                  <td class="center">3</td>
                  <td class="left">Hosting</td>
                  <td class="left">1 year subcription</td>

                  <td class="right">$499,00</td>
                  <td class="center">1</td>
                  <td class="right">$499,00</td>
                  <td class="right">$499,00</td>
               
                  </tr>

                  <tr>
                  <td class="center">4</td>
                  <td class="left">Platinum Support</td>
                  <td class="left">1 year subcription 24/7</td>

                  <td class="right">$3.999,00</td>
                  <td class="center">1</td>
                  <td class="right">$3.999,00</td>
                  <td class="right">$3.999,00</td>
               
                  </tr>
                </tbody>
              </table>
            </div>

          </div>
        </div>
      </div>
  
    </section>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
   
    <!-- /.content -->
 <!--  </div> -->
@endsection

@section('js')

@endsection