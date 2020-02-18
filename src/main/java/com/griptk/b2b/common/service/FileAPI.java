package com.griptk.b2b.common.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.griptk.b2b.common.domain.ImageVO;
import com.griptk.b2b.common.mapper.FileMapper;
import com.griptk.b2b.product.domain.ProductImgReqVO;

@RestController
@RequestMapping("/files")
public class FileAPI {
	@Value("${upload.location}")
	private String UPLOAD_DIR;
	
	@Autowired
	private FileMapper mapper;
	
	@GetMapping("/{img_no}")
	public ImageVO getFile(@PathVariable("img_no") long img_no) { 
		return mapper.getFile(img_no);
	}
	
	@PostMapping("/biz_image")
	public ImageVO uploadBizImage(@RequestPart (value="upload_file") MultipartFile upload_file) throws IllegalStateException, IOException {
		ImageVO imgVO = getImageVOFromMultipart("/biz_image/",upload_file);
		mapper.insertImgInfo(imgVO);
		long img_no = mapper.getImgNo();
		imgVO.setImg_no(img_no);
		return imgVO;
	}
	
	@Transactional
	//@PostMapping("/product_image")
	public List<ProductImgReqVO> uploadProductMultipleImages(int product_id, MultipartFile[] upload_files) throws IllegalStateException, IOException {
		List<ProductImgReqVO> result = new ArrayList<>();
		for(MultipartFile mf: upload_files) {
			ProductImgReqVO imgVO = uploadProductImage(product_id, mf);
			result.add(imgVO);
		}
		return result;
	}
	
	public ProductImgReqVO uploadProductImage(int product_id, MultipartFile upload_file) throws IllegalStateException, IOException {
		
		ImageVO imgVO = getImageVOFromMultipart("/product_image/",upload_file);
		mapper.insertImgInfo(imgVO);
		long img_no = mapper.getImgNo();		
		
		return new ProductImgReqVO(product_id, img_no);
	}
	
	@Transactional
	//@PostMapping("/product_image")
	public List<ProductImgReqVO> uploadProductMultipleImages(int product_id, long[] img_nos, MultipartFile[] upload_files) throws IllegalStateException, IOException {
		List<ProductImgReqVO> result = new ArrayList<>();
		for(int i=0; i<img_nos.length; i++) {
			long img_no = img_nos[i];
			MultipartFile mf = upload_files[i];
			if(img_no > 0) {
				uploadProductImage(product_id, img_no, mf);
			}else {
				ProductImgReqVO imgVO = uploadProductImage(product_id, mf);
				result.add(imgVO);				
			}
		}
		return result;
	}	
	
	public void uploadProductImage(int product_id, long img_no, MultipartFile upload_file) throws IllegalStateException, IOException {
		
		deleteFile(img_no);
		ImageVO imgVO = getImageVOFromMultipart("/product_image/",upload_file);
		imgVO.setImg_no(img_no);
		mapper.updateImgInfo(imgVO);
	}
	
	private void deleteFile(long file_no) {
		ImageVO img = mapper.getFile(file_no);
		String file_nm = img.getFile_nm();
		String absolute_file_nm = UPLOAD_DIR+file_nm;
		File f = new File(absolute_file_nm);
		if(f.exists()) f.delete();
	}
	
	
	
	private ImageVO getImageVOFromMultipart(String file_path, MultipartFile upload_file) throws IllegalStateException, IOException {
		String _file_path = null;
		
		if(file_path.endsWith("/")) _file_path = file_path + generateSubPath();
		else						_file_path = file_path + "/" + generateSubPath();
		
		String extension = "";
		String download_nm = upload_file.getOriginalFilename(); // file_name for download
		
		int i = download_nm.lastIndexOf('.');
		if (i >= 0) {
		    extension = download_nm.substring(i+1);
		}
		String file_nm = UUID.randomUUID().toString()+"."+extension; // file_name for upload
		String absolute_path = UPLOAD_DIR+_file_path;
		
		File dir_path = new File(absolute_path);
		if(!dir_path.exists()) dir_path.mkdirs();
		System.out.println("##################"+absolute_path);
		File img_file = new File(absolute_path+"/"+file_nm);
		upload_file.transferTo(img_file); // 파일을 위에 지정 경로로 업로드
		
		BufferedImage bimg = ImageIO.read(img_file);
		int width          = bimg.getWidth();
		int height         = bimg.getHeight();	
		
		ImageVO imgVo = new ImageVO();
		imgVo.setFile_nm(file_nm);
		imgVo.setFile_path(_file_path);
		imgVo.setFile_format(extension);
		imgVo.setFile_size(img_file.length());
		imgVo.setDownload_nm(download_nm);
		imgVo.setImg_width(width);
		imgVo.setImg_height(height);
		
		return imgVo;		
	}
	
	private String generateSubPath() {
		Calendar c = Calendar.getInstance();
		int yyyy = c.get(Calendar.YEAR);
		int mm = c.get(Calendar.MONTH);
		
		return yyyy+"/"+mm;
	}
}
