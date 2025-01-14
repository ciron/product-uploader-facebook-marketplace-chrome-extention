<?php


namespace App\Services;
use GuzzleHttp\Client;

use Exception;


class FacebookCatalogService
{
    protected $client;
    protected $accessToken;
    protected $catalogId;

    public function __construct()
    {
        $this->client = new Client(['base_uri' => 'https://graph.facebook.com/v16.0/']);
        $this->accessToken = env('FACEBOOK_ACCESS_TOKEN');
        $this->catalogId = env('FACEBOOK_CATALOG_ID');
    }

    public function uploadProducts($products)
    {
        $batch = ['requests' => []];
        foreach ($products as $product) {
            $batch['requests'][] = [
                'method' => 'UPDATE',
                'retailer_id' => $product['id'],
                'data' => [
                    'name' => $product['name'],
                    'description' => $product['description'],
                    'image_url' => asset($product['image_url']),
                    'price' => (float) $product['price'] * 100,
                    'availability' => 'in stock',
                    'category' => $product['category'],
                    'brand' => $product['brand']
                ]
            ];
        }

        $response = $this->client->post("{$this->catalogId}/batch", [
            'headers' => [
                'Authorization' => "Bearer {$this->accessToken}"
            ],
            'json' => $batch,
            'verify' => false,
        ]);

        return json_decode($response->getBody(), true);
    }
}
