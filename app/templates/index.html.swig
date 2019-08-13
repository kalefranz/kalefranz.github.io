<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">

  <title>Kale Franz</title>
  <!--
    ## About this page ##
      * Hosted using github pages at https://github.com/kalefranz/kalefranz.github.io  (source in stable branch)
      * Basic Twitter Bootstrap framework with custom theming
      * Templated using javascript's swig library; data kept in yaml format
      * Custom gulp-swig plugin to compile and then deploy
  -->

  <link rel="shortcut icon" href="/favicon.ico?v=3" type="image/x-icon">
  <link rel="icon" href="/favicon.ico?v=3" type="image/x-icon">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300,500|Crimson+Text:600italic' rel='stylesheet' type='text/css'>

  <!-- build:css styles/main.css -->
    <link rel="stylesheet" href="styles/main.css">
  <!-- endbuild -->

  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.min.js"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/3.5.0/modernizr.min.js"></script>
</head>

<body>

<div class="container">
  <div class="row header">
      <h1 id="masthead">Kale J. Franz</h1>
      <table class="table" id="social-table">
        <tr>
          <td><i class="fa fa-envelope-o icon"></i> kale@franz.io</td>
          <td><a href="https://github.com/kalefranz"><i class="fa fa-github-alt icon"></i> kalefranz</a></td>
          <td><a href="https://twitter.com/kalefranz"><i class="fa fa-fw icon">&#xf099</i>@kalefranz</a></td><!-- <i class="fa fa-twitter-square icon"></i> -->
        </tr>
         <!-- <tr>
          <td><a href="http://notinkansasnow.com/"><i class="fa fa-globe icon"></i> notinkansasnow.com</a></td>
         </tr> -->
      </table>
  </div>
</div>


<div class="container for-web">
<div class="row flex-md-row-reverse">

  <div class="col-md-7">

  <section class="experience">
    <h2>Experience</h2>
    <ul class="ul-group">
      {%- for x in Experience.concat(Experience2) %}
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

  </div> <!-- col-md-7 -->

  <div class="col-md-5">
    <section class="education">
    <h2>Education</h2>
    <ul class="ul-group">
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

  <section class="software-skills">
    <h2>Software Skills</h2>
    <ul class="ul-group spaced">
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
    <ul class="ul-group spaced">
      {%- for x in HardwareSkills %}
      <li>
        <span class="area">{{ x.area }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>

  <section class="non-technical-skills">
    <h2>Non-Technical Strengths</h2>
    <ul class="ul-group spaced">
      {%- for x in NonTechnicalSkills %}
      <li>
        <span class="area">{{ x.area }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>

  <section class="awards">
    <h2>Awards</h2>
    <ul class="ul-group spaced">
      {%- for x in Awards %}
      <li>
        <span class="year">{{ x.year }}</span>
        <span class="area">{{ x.award }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>

  {#
  <section class="activities">
    <h2>Activities &amp; Volunteer Service</h2>
    <ul class="ul-group spaced">
      {%- for x in Activities %}
      <li>
        <span class="year">{{ x.year }}</span>
        <span class="area">{{ x.activity }}</span>
      </li>
      {%- endfor %}
    </ul>
  </section>
  #}

  </div> <!-- col-md-5 -->

</div> <!-- row -->
</div> <!-- container -->

</body>
</html>
