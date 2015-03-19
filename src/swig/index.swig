{% extends "./layouts/main.swig" %}

{% block content %}
  <h1>Hello {{ name }}!</h1>

  {% include "./partials/message.swig" %}

  <my-tag color="{{ options['my-tag'].color }}"></my-tag>
{% endblock %}
