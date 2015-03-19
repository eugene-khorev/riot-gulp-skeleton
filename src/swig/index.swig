{% extends "./layouts/main.swig" %}

{% block content %}
  <h2>Hello {{ name }}!</h2>

  {% include "./partials/message.swig" %}

  <comment-box>{% autoescape false %}{{ comments | json }}{% endautoescape %}</comment-box>
{% endblock %}
