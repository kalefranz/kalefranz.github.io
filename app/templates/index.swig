<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">

  <title>Kale J. Franz, PhD</title>
  <!--
    ## About this page ##
      * Hosted using github pages at https://github.com/kalefranz/kalefranz.github.io  (source in stable branch)
      * Basic Twitter Bootstrap framework with custom theming
      * Templated using javascript's swig library; data kept in yaml format
      * Custom gulp-swig plugin to compile and then deploy
  -->

  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
  <link href='//fonts.googleapis.com/css?family=Ubuntu:400,500|Crimson+Text:600,600italic' rel='stylesheet' type='text/css'>

  <!-- build:css styles/main.css -->
    <link rel="stylesheet" href="styles/main.css">
  <!-- endbuild -->

  <script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.min.js"></script>
</head>

<body>

  <div class="container">

    <div class="row header">
        <h1 id="masthead">Kale J. Franz, PhD</h1>

        <table class="table" id="social-table">
          <tr>
            <td><i class="fa fa-envelope-o icon"></i> kale@franz.io</td>
            <td><a href="https://twitter.com/kalefranz"><i class="fa fa-twitter icon"></i> @kalefranz</a></td>
          </tr>
            <td><a href="https://github.com/kalefranz"><i class="fa fa-github-alt icon"></i> kalefranz</a></td>
            <td><a href="http://notinkansasnow.com/"><i class="fa fa-globe icon"></i> notinkansasnow.com</a></td>
          <tr></tr>
        </table>
    </div>


    <div class="row">

  <div class="col-sm-5">

    <div class="profile-panel">
      {{ ImpactStatement }}
    </div>

    <section class="education">
    <h2>Education</h2>
    <ul class="l1-group">
      {%- for x in Education %}
      <li>
        <span class="year">{{ x.year }}</span>
        <span class="institution">{{ x.institution }}</span>
        <span class="title">{{ x.title }}</span>
        <ul class="details fa-ul">
          {%- for detail in x.details %}
          <li><i class="fa-li fa fa-caret-right"></i>{{ detail }}</li>
          {%- endfor %}
        </ul>
      </li>
      {%- endfor %}
    </ul>
  </section>

  <section class="non-technical-skills">
    <h2>Non-Technical Strengths</h2>
    <ul class="l2-group">
      {%- for x in NonTechnicalSkills %}
      <li>
        <span class="area">{{ x.area }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>

  <section class="software-skills">
    <h2>Software Skills</h2>
    <ul class="l2-group">
      {%- for x in SoftwareSkills %}
      <li>
        {%- if x.specifics %}
          <span class="area decorated">{{ x.area }}: </span>
          <span class="specifics">{{ x.specifics|join(', ') }}</span>
        {% else -%}
          <span class="area">{{ x.area }}</span>
        {% endif -%}        
      </li>
      {%- endfor %}
    </ul>
  </section>

  <section class="hardware-skills">
    <h2>Hardware Specialization</h2>
    <ul class="l2-group">
      {%- for x in HardwareSkills %}
      <li>
        <span class="area">{{ x.area }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>

  <section class="awards">
    <h2>Awards</h2>
    <ul class="l2-group">
      {%- for x in Awards %}
      <li>
        <span class="year">{{ x.year }}</span>
        <span class="area">{{ x.award }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>

  <section class="activities">
    <h2>Activities &amp; Volunteer Service</h2>
    <ul class="l2-group">
      {%- for x in Activities %}
      <li>
        <span class="year">{{ x.year }}</span>
        <span class="area">{{ x.activity }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>

  </div>
  <div class="col-sm-7">

  <section class="experience">
    <h2>Experience</h2>
    <ul class="l1-group">
      {%- for x in Experience %}
      <li>
        <span class="year">{{ x.year }}</span>
        <span class="institution">{{ x.institution }}</span>
        <span class="location">{{ x.location }}</span>
        <span class="title">{{ x.title }}</span>
        <ul class="details fa-ul">
          {%- for detail in x.details %}
            <li><i class="fa-li fa fa-caret-right"></i>{{ detail }}
              {%- if loop.last and x.subdetails %}
                <ul class="subdetails">
                  {%- for subdetail in x.subdetails %}
                  <li>{{ subdetail }}</li>
                  {%- endfor %}
                </ul>
              {% endif -%}
            </li>
          {%- endfor %}
        </ul>
      </li>
      {%- endfor %}
    </ul>
  </section>

  </div>
  </div>
  </div>


</body>
</html>
