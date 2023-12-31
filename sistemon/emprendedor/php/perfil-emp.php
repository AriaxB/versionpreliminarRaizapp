<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style-emp-hyf.css">
    <link rel="stylesheet" href="../css/perfil-emp.css">
    <title>RAIZAPP</title>
</head>
<body>
<header>
        <div class="header1">
            <img style="height: 30%;" src="../../multimedia/RAIZAPProjo.png" alt="">
        </div>
        <nav class="menu">
            <ul><li><a href="inicio-emp.php">inicio</a></li></ul>
            <ul>
                <li><a href="">productos</a>
                    <ul class="menuv">
                        <li><a href="add-prod.php">subir</a></li>
                        <li><a href="show-prod.php">editar</a></li>
                        <li><a href="show-prod.php">mis productos</a></li>
                        <li><a href="ayuda.php">ayuda</a></li>
                    </ul>
                </li>
            </ul>
            <ul><li><a href="#"><img src="../../multimedia/user.png" alt=""></a>
                <ul class="menuv">
                    <li><a href="">mi perfil</a></li>
                    <li><a href="">cerrar sesion</a></li>
                </ul>
            </li></ul>
        </nav>
    </header>
    <main>
        <?php 
        include('../../backend/conexion.php');
            $result = $_COOKIE['emprendedor_cookie'];
            $user_emp="SELECT * FROM emprendedor where ced_emprendedor='$result'";
            $resultado=mysqli_query($conexion,$user_emp);
            while($row=mysqli_fetch_array($resultado)){?>
                <div class="info-user">
                    <h1>INFORMACION PERFIL</h1>
                    <p><?php echo "nombre usuario: ". $row['nombre']."".$row['apellido'] ?></p>
                    <p><?php echo "nombre emprendimiento: ". $row['nombre_emprendimiento'] ?></p>
                    <p><?php echo "balance: ". $row['balance'] ?></p>
                    <p><?php echo "numero cuenta: ". $row['num_cuenta'] ?></p>
                    <p><?php echo "usuario: emprendedor" ?></p>
                    <a href="editar-perfil-emp.php"><button class="boton_editar">EDITAR DATOS</button></a>
                </div>
          <?php  } ?>
    </main>
    <footer class="FooterMain">
        <div class="links-footer">
            <div class="container-links">
                <a href="#">se parte de nuestra comunidad</a>
                <a href="#">terminos y condiciones</a>
                <a href="#">informacion</a>
            </div>
        </div>
        <div class="container-links2">
            <a href="#">accesibilidad</a>
            <a href="#">como cuidamos tus datos</a>
            <a href="#">Ayuda</a>
        </div>
        <div class="HelpConteners">
            <h2 class="TheReds">!Nuestras Redes!</h2>
            <div class="Reds">
                <a href=""><img class="Facebook-Icon" src="../../multimedia/icon-facebook.png" alt=""></a>
                <a href=""><img src="../../multimedia/icon-instagram.png" alt=""></a>
                <a href=""><img  src="../../multimedia/icon-twitter.png" alt=""></a>
            </div>
        </div>
 </footer>