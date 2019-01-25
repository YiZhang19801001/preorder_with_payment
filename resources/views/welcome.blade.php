<!doctype html>
<html lang="{{ app()->getLocale() }}">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{config('app.name')}}</title>

        <link rel="stylesheet" href="{{asset('css/app.css')}}">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
        rel="stylesheet">

    </head>

    <body>
        <div id="root"></div>

        <script src="{{asset('js/app.js')}}"></script>

    </body>

</html>
