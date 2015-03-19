var path = require('path');
var gulp = require('gulp');
var clean = require('gulp-clean');
var concat = require('gulp-concat');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var riot = require('gulp-riot');
var csso = require('gulp-csso');
var swig = require('gulp-swig');
var htmlmin = require('gulp-htmlmin');
var files = require('gulp-filelist');
var json = require('jsonfile')
var watch = require('gulp-watch');
var sync = require('browser-sync');

gulp.task('clean-styles', function () {
  return gulp.src(['./dist/*.css', './build/*.css'], {
      read: false
    })
    .pipe(clean());
});

gulp.task('clean-scripts', function () {
  return gulp.src(['./dist/*.js', './build/*.js'], {
      read: false
    })
    .pipe(clean());
});

gulp.task('clean-templates', function () {
  return gulp.src(['./build/*.html', './*.html'], {
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
  return gulp.src(['./src/css/*.css'])
    .pipe(concat('all.css'))
    .pipe(gulp.dest('./build'))
    .pipe(rename('all.min.css'))
    .pipe(csso())
    .pipe(gulp.dest('./dist'))
    .pipe(sync.reload({
      stream: true
    }));
});

gulp.task('tags', ['clean-taglist', 'clean-scripts'], function (cb) {
  return gulp.src(['./src/tag/*.tag'])
    .pipe(riot())
    .pipe(gulp.dest('./build'))
    .pipe(files('taglist.json'))
    .pipe(gulp.dest('./build'));
});

gulp.task('scripts', ['tags'], function (cb) {
  return gulp.src(['./node_modules/riot/riot.js', './build/*.js', './src/js/*.js'])
    .pipe(concat('all.js'))
    .pipe(gulp.dest('./build'))
    .pipe(rename('all.min.js'))
    .pipe(uglify())
    .pipe(gulp.dest('./dist'))
    .pipe(sync.reload({
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

  return gulp.src('./src/swig/*.swig')
    .pipe(swig(opts))
    .pipe(gulp.dest('./build'))
    .pipe(htmlmin({
      removeComments: true,
      collapseWhitespace: true,
      conservativeCollapse: true,
      removeEmptyAttributes: true,
      collapseBooleanAttributes: true,
    }))
    .pipe(gulp.dest('./'))
    .pipe(sync.reload({
      stream: true
    }));
});

gulp.task('serve', ['styles', 'scripts', 'templates'], function (cb) {
  sync({
    server: './'
  });

  watch(['./src/css/*.css'], function (event) {
    gulp.start('styles');
  });

  watch(['./src/js/*.js', './src/tag/*.tag', './src/json/*.json', './src/swig/partials/*.swig', './src/swig/*.swig'], function (event) {
    gulp.start('templates');
  });
});

gulp.task('default', ['serve']);
