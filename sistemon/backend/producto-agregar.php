<html>

<head>
    <title>RAIZAPP</title>
    <link rel="stylesheet" href="registroExitoso">
    <script>
        function devolver() {
            window.location.href = '../emprendedor/php/inicio-emp.php'
        }
    </script>
    <link rel="stylesheet" href="registroExitoso.css">
</head>

<body>
    <?php
    include('conexion.php');
    $nombre_prod = $_POST['nombre_prod'];
    $precio_prod = $_POST['precio-prod'];
    $cantidad_prod = $_POST['cantidad'];
    $descripcion_prod = $_POST['descripcion'];
    $estado_prod = $_POST['estado_prod'];
    $cat_prod=$_POST['catalogo'];
    $nombreArchivo = $_FILES['imagen']['name'];
    $rutaArchivo = $_FILES['imagen']['tmp_name'];

    $directorioDestino = '../img/';

    $rutaDestino = 'img/' . $nombreArchivo;
    move_uploaded_file($rutaArchivo, $directorioDestino . $nombreArchivo);

    $query1 = "INSERT INTO producto(nombre_producto,foto,descripcion,cantidad_producto
    ,precio,estado_producto,id_catalogo)values('$nombre_prod','$rutaDestino','$descripcion_prod','$cantidad_prod','$precio_prod','$estado_prod','$cat_prod')";

    if ($conexion->query($query1) === true) {?>
                <div class="mensaje-confirm">
            <h1><?php echo "EL PRODUCTO FUE REGISTRADO EXITOSAMENTE" ?></h1>
                <button onclick="devolver()" >VOLVER AL INICIO</button>
            </div>
   <?php } else {
        die('error' . mysqli_connect($query1));
    }
    ?>
</body>

</html>