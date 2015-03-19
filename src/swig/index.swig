{% extends "./layouts/main.swig" %}

{% block content %}
  <h2>Hello {{ name }}!</h2>

  {% include "./partials/message.swig" %}

  <script>
    var commentList = {% autoescape false %}{{ comments | json }}{% endautoescape %};
  </script>
  <comment-box comments="{ commentList }"></comment-box>

{% endblock %}
