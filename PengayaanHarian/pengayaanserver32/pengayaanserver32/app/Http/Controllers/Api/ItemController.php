<?php

// namespace App\Http\Controllers\Api;

// use App\Http\Controllers\Controller;
// use Illuminate\Http\Request;

// class ItemController extends Controller
// {
//     /**
//      * Display a listing of the resource.
//      */
//     public function index()
//     {
//         //
//     }

//     /**
//      * Store a newly created resource in storage.
//      */
//     public function store(Request $request)
//     {
//         //
//     }

//     /**
//      * Display the specified resource.
//      */
//     public function show(string $id)
//     {
//         //
//     }

//     /**
//      * Update the specified resource in storage.
//      */
//     public function update(Request $request, string $id)
//     {
//         //
//     }

//     /**
//      * Remove the specified resource from storage.
//      */
//     public function destroy(string $id)
//     {
//         //
//     }
// }
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Item;
class ItemController extends Controller {
  public function index() {
     $items = Item::all();
     return response()->json($items);
   }
   public function store(Request $request) {
    $request->validate([ 'name' => 'required', 'description' => 'required', ]);
    $item = Item::create($request->all());
    return response()->json($item, 201);
    }
    public function show(Item $item) {
     return response()->json($item); }
     public function update(Request $request, Item $item) {
       $request->validate([ 'name' => 'required', 'description' => 'required', ]);
       $item->update($request->all());
        return response()->json($item);
       }
    public function destroy(Item $item) {
      $item->delete();
      return response()->json(null, 204);
     }
}