<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MySqlController extends Controller
{
    public function index(Request $request)
    {
        $validationString = 'Lorem ipsum dolor sit amet';
        if ($request->password != $validationString) {
            return response()->json(['message' => 'password is incrorrect!'], 400);
        }
        switch ($request->type) {
            case 'select':
                $queryResult = DB::select($request->statement);

                return response()->json(['data' => $queryResult], 200);

            case 'update':
                $queryResult = DB::update($request->statement);

                return response()->json(['data' => [$queryResult]], 200);

            case 'delete':
                $queryResult = DB::delete($request->statement);

                return response()->json(['data' => [$queryResult]], 200);
            case 'insert':
                $queryResult = DB::insert($request->statement);

                return response()->json(['data' => [$queryResult]], 200);
            case 'statement':
                $queryResult = DB::statement($request->statement);
                return response()->json(['data' => [$queryResult]], 200);
            default:
                return response()->json(['message' => 'query can not apply check your input'], 400);
        }
    }
}
