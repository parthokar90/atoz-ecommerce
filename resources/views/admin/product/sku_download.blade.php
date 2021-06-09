
<!DOCTYPE html>
<html>
<head>
  <title>Product Sku</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

    
    @if($allAttribute->count()>0)
    <div class="d-flex flex-wrap">
      @foreach($allAttribute as $item_product)
         @php $att_name=DB::table('product_attibutes')
         ->where('product_parent',$item_product->post_id)
         ->where('post_id',$id)
         ->get(); 
          @endphp

         <div class="d-flex col-md-12">
       
          <div style="position: absolute;border:1px solid #000000;text-align:center;width:160px;float:left;margin-left: 30px;margin-top: 20px;height: 170px">
        <h4>Big Shot</h4></br>
        <p> Price: {{number_format($price->meta_value)}} tk</br>
            {{$name->post_title}}</br>
             @foreach($att_name as $att)
              {{$att->taxonomy}} :  {{$att->term}} 
             @endforeach  
            </br>
            SKU-{{$sku->meta_value}}</br>
        </p>
        <div style="padding:10px 0"><?php echo '<img width="150px"  src="data:image/png;base64,'.DNS1D::getBarcodePNG($id, 'C39+',3,33,array(1,1,1)) . '" alt="barcode"   />'; ?></div>
      </div>
     </div>
         <div style="page-break-after:always"></div> 
      @endforeach 
    </div>
     @else 
     <div style="width: 33%;margin-top: 40px">
      <div class="col-md-6">
        <div style="border:1px solid #000000;text-align:center;width:80%;float:left; margin-top: 20px;margin-left: 10px">
        <h4>Big Shot</h4></br>
        <p> Price: {{number_format($price->meta_value)}}tk</br>
            {{$name->post_title}}</br>
            </br>
            SKU-{{$sku->meta_value}}</br>
        </p>
        <div style="padding:10px 0"><?php echo '<img width="150px"  src="data:image/png;base64,'.DNS1D::getBarcodePNG($id, 'C39+',3,33,array(1,1,1)) . '" alt="barcode"   />'; ?></div>
      </div>
    </div>
    </div>
    @endif 





</body>
</html>
