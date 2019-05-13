---
refcn: chapter_02/mux
refen: configuration/mux
---

# Ghép kênh

Ghép kênh, hoặc Mux, là sử dụng một kết nối TCP vật lý cho nhiều kết nối TCP ảo.

Mux được thiết kế để giảm độ trễ bắt tay TCP. Nó KHÔNG phải cho thông lượng cao. Khi được sử dụng để tải xuống các tệp lớn hoặc đo tốc độ, Mux thường chậm hơn kết nối TCP thông thường.

## MuxObject

```javascript
{
  "enabled": false,
  "concurrency": 8
}
```

> `enabled`: true | false

Có hay không kích hoạt Mux trên đường đi.

> `concurrency`: number

Số lượng kết nối ghép kênh tối đa mà một kết nối vật lý có thể xử lý tại một thời điểm. Giá trị lớn nhất `1024`, giá trị nhỏ nhất `1`, mặc định `8`.