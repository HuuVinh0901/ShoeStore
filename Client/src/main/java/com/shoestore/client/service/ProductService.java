package com.shoestore.client.service;



import com.shoestore.client.dto.request.ProductDTO;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface ProductService {
    List<ProductDTO> getAllProduct();

    public ProductDTO addProduct(ProductDTO productDTO);
    public ProductDTO getProductByIdForDetail(int id);

    public ProductDTO getProductById(int id);
    List<ProductDTO> getFilteredProducts(List<Integer> category, List<Integer> brand, List<String> color, List<String> size, Double minPrice, Double maxPrice);
}
