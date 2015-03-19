{% extends "./layouts/main.swig" %}

{% block content %}
  <h2>Hello {{ name }}!</h2>

  {% include "./partials/message.swig" %}

  <comment-box comments="{ data.comments }"></comment-box>

{% endblock %}
