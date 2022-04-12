'use strict';

const gulp = require('gulp');
const yaml = require('js-yaml');
const fs   = require('fs');
// const autoprefixer = require('gulp-autoprefixer');
// const data = require('gulp-data');
// const swig = require('gulp-swig');
// const size = require('gulp-size');

const sass = require('gulp-sass');
sass.compiler = require('node-sass');

const $ = require('gulp-load-plugins')();


gulp.task('templates', function () {
    return gulp.src('app/templates/**/*.swig')
        .pipe($.data(function(file) {
            return yaml.safeLoad(fs.readFileSync(file.path.replace(/\.swig$/g, '.yaml'), 'utf8'));
        }))
        .pipe($.swig())
        .pipe($.if('**/*.html.html', $.rename(function (path) {
            path.basename = path.basename.slice(0, -5)
        })))
        .pipe(gulp.dest('.tmp'))
        .pipe($.size());
});

gulp.task('styles', function () {
    return gulp.src('app/styles/main.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe($.autoprefixer('last 1 version'))
        .pipe(gulp.dest('.tmp/styles'))
        .pipe($.size());
});

// // gulp.task('movetmp', function () {
// //     return gulp.src(['.tmp/**/*', '!.tmp/**/*.html'])
// //         .pipe(gulp.dest('app/'))
// //         .pipe($.size());
// // });


// gulp.task('scripts', function () {
//     return gulp.src('app/scripts/**/*.js')
//         .pipe($.jshint())
//         .pipe($.jshint.reporter(require('jshint-stylish')))
//         .pipe($.size());
// });

// gulp.task('html', ['templates', 'styles', 'scripts'], function () {
//     var jsFilter = $.filter('**/*.js');
//     var cssFilter = $.filter('**/*.css');

//     return gulp.src(['app/*.html', '.tmp/*.html', '.tmp/*.txt'])
//         .pipe($.useref.assets({searchPath: '{.tmp,app}'}))
//         .pipe(jsFilter)
//         .pipe($.uglify())
//         .pipe(jsFilter.restore())
//         .pipe(cssFilter)
//         .pipe($.csso())
//         .pipe(cssFilter.restore())
//         .pipe($.useref.restore())
//         .pipe($.useref())
//         .pipe(gulp.dest('dist'))
//         .pipe($.size());
// });

gulp.task('html', function () {
    return gulp.src(['app/*.html', '.tmp/*.html', '.tmp/*.txt'])
        .pipe($.useref())
        .pipe($.if('*.css', $.cleanCss()))
        .pipe(gulp.dest('dist'))
        .pipe($.size());
});

// gulp.task('images', function () {
//     return gulp.src('app/images/**/*')
//         .pipe($.cache($.imagemin({
//             optimizationLevel: 3,
//             progressive: true,
//             interlaced: true
//         })))
//         .pipe(gulp.dest('dist/images'))
//         .pipe($.size());
// });

// gulp.task('fonts', function () {
//     return $.bowerFiles()
//         .pipe($.filter('**/*.{eot,svg,ttf,woff}'))
//         .pipe($.flatten())
//         .pipe(gulp.dest('dist/fonts'))
//         .pipe($.size());
// });

gulp.task('extras', function () {
    return gulp.src(['app/*.*', 'app/CNAME', '!app/*.html'], { dot: true })
        .pipe(gulp.dest('dist'));
});

gulp.task('clean', function () {
    return gulp.src(['.tmp', 'dist', '.publish'], { read: false, allowEmpty: true }).pipe($.clean());
});

// gulp.task('build', ['html', 'images', 'styles', 'extras']);
gulp.task('build', gulp.series('clean', gulp.series(gulp.parallel('templates', 'styles', 'extras'), 'html')));


// gulp.task('connect', function () {
//     var connect = require('connect');
//     var app = connect()
//         .use(require('connect-livereload')({ port: 35729 }))
//         .use(connect.static('app'))
//         .use(connect.static('.tmp'))
//         .use(connect.directory('app'));

//     require('http').createServer(app)
//         .listen(9000)
//         .on('listening', function () {
//             console.log('Started connect web server on http://localhost:9000');
//         });
// });

// gulp.task('serve', ['connect', 'html', 'styles'], function () {
//     require('opn')('http://localhost:9000');
// });

// gulp.task('watch', ['connect', 'serve'], function () {
//     var server = $.livereload();

//     // watch for changes

//     gulp.watch([
//         'app/**/*.html',
//         '.tmp/**/*.html',
//         'app/templates/**/*',
//         '.tmp/styles/**/*.css',
//         'app/scripts/**/*.js',
//         'app/images/**/*'
//     ]).on('change', function (file) {
//         server.changed(file.path);
//     });

//     // gulp.watch('app/styles/**/*.scss', ['styles']);
//     // gulp.watch('app/scripts/**/*.js', ['scripts']);
//     // gulp.watch('app/images/**/*', ['images']);
//     gulp.watch('app/**/*', ['html']);
//     gulp.watch('bower.json', ['wiredep']);
// });

gulp.task('deploy', gulp.series('build', async function () {
    gulp.src("./dist/**/*")
        .pipe($.ghPages({branch: 'master'}))
        .pipe($.size());
}));
