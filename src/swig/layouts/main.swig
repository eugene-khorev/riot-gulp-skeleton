<html>

<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="css/all.css">
  <!--[if lt IE 9]>
    <script src="node_modules/es5-shim/es5-sham.js"></script>
    <script src="node_modules/html5shiv/dist/html5shiv.jsh"></script>
    <script>html5.addElements('{{ tags }}')</script>
  <[endif]-->
  <title>Page: {{ page }}</title>
</head>

<body>
  {% block content %}{% endblock %}

  <script type="application/javascript" src="js/all.js"></script>
</body>

</html>
