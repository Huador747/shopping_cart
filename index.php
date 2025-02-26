<?php
include('h.php');
include("condb.php");
?>
<!DOCTYPE html>

<head>
  <?php include('boot4.php'); ?>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
  <?php
  include('banner.php');
  include('navbar.php');
  ?>
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-2 col-md-4 col-sm-12">
        <?php include('menu.php');?>
      </div>
      <div class="col-lg-10 col-md-8 col-sm-12" style="margin-top: 10px">
        <?php
        $act = (isset($_GET['act']) ? $_GET['act'] : '');
        $q = isset($_GET['q']) ? $_GET['q'] : ''; // Check if 'q' parameter is set
        if ($act == 'showbytype') {
          include('show_product_type.php');
        } else if ($q != '') {
          include("show_product_q.php");
        } else if ($act == 'add') {
          include("member_form_add.php");
        } else {
          include('show_product.php');
        }
        ?>
      </div>
    </div>
  </div>
  <?php include('script4.php'); ?>
</body>

</html>