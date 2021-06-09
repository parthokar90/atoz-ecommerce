@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Slider</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<a href="{{route('admin.home')}}">Home</a>
						</li>
						<li class="breadcrumb-item active">Slider</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="container-fluid">
        @include('admin.includes.messages')
			<div class="row">
				<div class="col-md-5">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Slider</h3>
            </div>
            <form role="form" method="POST" action="{{route('slider.store')}}" enctype="multipart/form-data"> 
			@csrf  
                                <div class="card-body">

                                    <div class="form-group">
                                        <label for="categoryName">Image <span style="color:red">*</label>
                                        <input type="file" name="slider_img" class="form-control" accept="image/x-png,image/gif,image/jpeg" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Url</label>
                                        <input type="text" class="form-control" name="slider_url" autocomplete="off">
                                    </div>

                                </div>
								
								<div class="card-footer">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-save"></i> Add Slider
									</button>
								</div>
                          </form>
						</div>
					</div>
					
					<div class="col-md-7">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Slider List</h3>
							</div>
							<div class="card-body">
								<table class="table table-bordered table-striped">
									<thead class="bg-info">
										<tr>
											<th style="width: 10px">#</th>
											<th>Image</th>
											<th>Url</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
                                       @foreach($slider as $key=>$item)
                                        @php 
                                          $img=DB::table('postmeta')->where('post_id',$item->ID)->where('meta_key','slider_img')->first(); 
                                          $url=DB::table('postmeta')->where('post_id',$item->ID)->where('meta_key','slider_url')->first(); 
                                        @endphp
                                        @if($item->post_status=='unpublish')
										<tr style="background: red;">
											<td>{{++$key}}</td>

											  <td>
                                                 @if(isset($img)) 
                                                    <img width="70px" height="70px" src="{{asset('backend/slider/'.$img->meta_value)}}">
                                                 @endif 
                                              </td> 

                                              <td>
                                                @if(isset($url)) 
                                                  {{$url->meta_value}}
                                                @endif 
                                              </td>
                                              <td>
                                               {{ucfirst($item->post_status)}}
                                              </td>
											<td>
												<a href="{{route('slider.edit',$item->ID)}}" class="btn btn-primary btn-sm"">
													<i class="fa fa-trash"></i> Edit
												</a>
                                                    <form action="{{ route('slider.destroy',$item->ID)}}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button onclick="return confirm('are you sure?')" class="btn btn-danger btn-sm" type="submit">Delete</button>
                                                 </form>
											</td>
                                        </tr>
                                        @else 
                                        <tr>
											<td>{{++$key}}</td>

											  <td>
                                                 @if(isset($img)) 
                                                    <img width="70px" height="70px" src="{{asset('backend/slider/'.$img->meta_value)}}">
                                                 @endif 
                                              </td> 

                                              <td>
                                                @if(isset($url)) 
                                                  {{$url->meta_value}}
                                                @endif 
                                              </td>
                                              <td>
                                                {{ucfirst($item->post_status)}}
                                              </td>
											<td>
												<a href="{{route('slider.edit',$item->ID)}}" class="btn btn-primary btn-sm"">
													<i class="fa fa-trash"></i> Edit
												</a>
                                                    <form action="{{ route('slider.destroy',$item->ID)}}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button onclick="return confirm('are you sure?')" class="btn btn-danger btn-sm" type="submit">Delete</button>
                                                 </form>
											</td>
                                        </tr>
                                        @endif 
                                       @endforeach  
									</tbody>
								</table>
							</div>
							<div class="d-flex justify-content-center"></div>
						</div>
					</div>
                    
				</div>
			</div>
		</div>
	</section>
</div>
@endsection