<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Services\FacebookCatalogService;
use Illuminate\Support\Facades\Log;
use App\Helpers\ApiResponse;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{

    protected $facebookCatalogService;

    public function __construct(FacebookCatalogService $facebookCatalogService)
    {
        $this->facebookCatalogService = $facebookCatalogService;
    }


    public function GetProduct()
    {
        try {

            $all_product = Product::where('status', 0)
                ->where('availability', 'in stock')
                ->orderBy('id', 'desc')
                ->get();

            return ApiResponse::success(ProductResource::collection($all_product), 'Products retrieved successfully');

        } catch (\Exception $e) {
            // Log the error for debugging
            Log::error("Failed to retrieve products", ['error' => $e->getMessage()]);
            return ApiResponse::error('Failed to retrieve products', 500, $e->getMessage());
        }
    }


    public function addProductsToCatalog(Request $request)
    {
        $request->validate([
            'product_ids' => 'required'
        ]);

        try {
            $productIds = $request->product_ids;
            $productIds = explode(',', $productIds);
            $products = Product::whereIn('id',$productIds)->get(); // Fetch all products

            if ($products->count() > 1) {
                $response = $this->facebookCatalogService->uploadProducts($products->toArray()); // Upload products to Facebook Catalog

                foreach ($products as $product) {
                    $product->update(['status' => 1]);
                }
                return ApiResponse::success($response, 'Products Uploaded successfully');
            } else {
                return ApiResponse::error('Not enough products to execute this operation', 400);
            }

        } catch (\Exception $e) {
            // Log the error and return a JSON response
            Log::error("Failed to process products", ['error' => $e->getMessage()]);
            return ApiResponse::error('An error occurred while processing products.', 500, $e->getMessage());
        }
    }


}
