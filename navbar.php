<?php require_once('condb.php'); $query_typeprd = "SELECT * FROM tbl_type ORDER BY type_id ASC"; $typeprd = mysqli_query($con, $query_typeprd) or die("Error in query: $query_typeprd " . mysqli_error($con)); $row_typeprd = mysqli_fetch_assoc($typeprd); $totalRows_typeprd = mysqli_num_rows($typeprd); ?> 
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #333;">
                <a class="btn btn-secondary" href="index.php" role="button">หน้าหลัก</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <ul class="navbar-nav ml-2">
                    <li class="nav-item">
                        <a class="btn btn-secondary" href="index.php?act=add" role="button">สมัครสมาชิก</a>
                    </li>
                    <?php if (!isset($member_id) || $member_id == '') { ?>
                        <li class="nav-item ml-2">
                            <a class="btn btn-success" href="form_login.php" role="button">เข้าสู่ระบบ</a>
                        </li>
                    <?php } else { ?>
                        <li class="nav-item ml-2">
                            <a class="btn btn-secondary" href="logout.php" role="button"
                                onclick="return confirm('คุณต้องการออกจากระบบหรือไม่ ?')">ออกจากระบบ</a>
                        </li>
                    <?php } ?>
                </ul>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                    </ul>
                    <!-- Cart Image Icon with Login Check -->
                    <?php if (!isset($member_id) || $member_id == '') { ?>
                        <a href="#" class="mr-2" title="ตะกร้าสินค้า" style="display: inline-block; margin-top: 5px;" 
                           onclick="alert('กรุณาเข้าสู่ระบบก่อนใช้งานตะกร้าสินค้า'); window.location.href='form_login.php'; return false;">
                            <img src="m_img/8648831.png" alt="ตะกร้าสินค้า" style="height: 25px; width: auto;">
                        </a>
                    <?php } else { ?>
                        <a href="cart.php" class="mr-2" title="ตะกร้าสินค้า" style="display: inline-block; margin-top: 5px;">
                            <img src="m_img/8648831.png" alt="ตะกร้าสินค้า" style="height: 25px; width: auto;">
                        </a>
                    <?php } ?>
                    <form class="form-inline my-2 my-lg-0" name="qp" action="index.php" method="GET">
                        <input class="form-control mr-sm-2" type="text" placeholder="ค้นหาสินค้า" name="q">
                        <button class="btn btn-secondary my-2 my-sm-0" type="submit">ค้นหา</button>
                    </form>
                </div>
            </nav>
        </div>
    </div>
</div>