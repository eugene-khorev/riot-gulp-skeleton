{% extends "./layouts/main.swig" %}

{% block content %}
<!--
  <h2>Hello {{ name }}!</h2>

  {% include "./partials/message.swig" %}
-->

  <tab-box name="tab-nav"></tab-box>

  <comment-box name="comments1" dataset="all-comments"></comment-box>

  <comment-box name="comments2" dataset="all-comments"></comment-box>

{% endblock %}
