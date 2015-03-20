var path = require('path');
var json = require('jsonfile')
var gulp = require('gulp');
var sync = require('browser-sync');
var clean = require('gulp-clean');
var concat = require('gulp-concat');
var wrap = require('gulp-wrap');
var uglify = require('gulp-uglify');
var riot = require('gulp-riot');
var csso = require('gulp-csso');
var swig = require('gulp-swig');
var htmlmin = require('gulp-htmlmin');
var files = require('gulp-filelist');
var watch = require('gulp-watch');

gulp.task('clean-styles', function () {
  return gulp.src(['./dist/css', './build/css'], {
      read: false
    })
    .pipe(clean());
});

gulp.task('clean-scripts', function () {
  return gulp.src(['./dist/js', './build/js'], {
      read: false
    })
    .pipe(clean());
});

gulp.task('clean-templates', function () {
  return gulp.src(['./build/*.html', './dist/*.html'], {
      read: false
    })
    .pipe(clean());
});

gulp.task('clean-taglist', function () {
  return gulp.src(['./build/taglist.json'], {
      read: false
    })
    .pipe(clean());
});

gulp.task('styles', ['clean-styles'], function (cb) {
  var task = gulp.src(['./src/css/*.css'])
    .pipe(concat('all.css'))
    .pipe(gulp.dest('./build/css'));

  if (!debug) {
    task.pipe(csso())
      .pipe(gulp.dest('./dist/css'))
  }

  return task.pipe(sync.reload({
    stream: true
  }));
});

gulp.task('tags', ['clean-taglist', 'clean-scripts'], function (cb) {
  return gulp.src(['./src/tag/**/*.tag'])
    .pipe(riot())
    .pipe(concat('tags.js'))
    .pipe(wrap(';new RiotApp(function(app){\n<%= contents %>\n});'))
    .pipe(gulp.dest('./build/js'))
    .pipe(files('taglist.json'))
    .pipe(gulp.dest('./build'));
});

gulp.task('scripts', ['tags'], function (cb) {
  var task = gulp.src(['./node_modules/riot/riot.js', './src/js/**/*.js', './build/js/tags.js'])
    .pipe(concat('all.js'))
    .pipe(gulp.dest('./build/js'));

  if (!debug) {
    task.pipe(uglify())
      .pipe(gulp.dest('./dist/js'))
  }

  return task.pipe(sync.reload({
    stream: true
  }));
});

gulp.task('templates', ['clean-templates', 'scripts'], function (cb) {
  var taglist = json.readFileSync('./build/taglist.json');
  var tags = taglist.map(function (tagfile) {
    return path.basename(tagfile, path.extname(tagfile));
  });
  var opts = {
    load_json: true,
    json_path: './src/json/',
    defaults: {
      cache: false,
      locals: {
        name: 'World'
      }
    },
    data: {
      tags: tags.join(' ')
    }
  };

  var task = gulp.src(['./src/swig/*.swig'])
    .pipe(swig(opts))
    .pipe(gulp.dest('./build'));

  if (!debug) {
    task.pipe(htmlmin({
        removeComments: true,
        collapseWhitespace: true,
        conservativeCollapse: true,
        removeEmptyAttributes: true,
        collapseBooleanAttributes: true,
      }))
      .pipe(gulp.dest('./dist'))
  }

  return task.pipe(sync.reload({
    stream: true
  }));
});

gulp.task('serve', ['styles', 'scripts', 'templates'], function (cb) {
  sync({
    server: debug ? './build' : './dist'
  });

  watch(['./src/css/*.css'], function (event) {
    gulp.start('styles');
  });

  watch(['./src/js/**/*.js', './src/tag/**/*.tag', './src/json/*.json', './src/swig/layouts/*.swig', './src/swig/partials/*.swig', './src/swig/*.swig'], function (event) {
    gulp.start('templates');
  });
});

gulp.task('debug', function (event) {
  debug = true;
  gulp.start('serve');
});

gulp.task('default', function (event) {
  debug = false;
  gulp.start('serve');
});

// default value (DO NOT CHANGE)
var debug = false;
