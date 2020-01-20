package com.griptk.b2b.common.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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

@RestController
@RequestMapping("/files")
public class FileAPI {
	@Value("${upload.location}")
	private String UPLOAD_DIR;
	
	@Autowired
	private FileMapper mapper;
	
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
	public List<ImageVO> uploadProductImages(List<MultipartFile> upload_files) throws IllegalStateException, IOException {
		List<ImageVO> result = new ArrayList<>();
		for(MultipartFile mf: upload_files) {
			ImageVO imgVO = getImageVOFromMultipart("/product_image/",mf);
			mapper.insertImgInfo(imgVO);
			long img_no = mapper.getImgNo();
			imgVO.setImg_no(img_no);
			result.add(imgVO);
		}
		return result;
	}
	
	@GetMapping("/{img_no}")
	public ImageVO getFile(@PathVariable("img_no") long img_no) { 
		return mapper.getFile(img_no);
	}
	
	private ImageVO getImageVOFromMultipart(String file_path, MultipartFile upload_file) throws IllegalStateException, IOException {
		String extension = "";
		String download_nm = upload_file.getOriginalFilename(); // file_name for download
		
		int i = download_nm.lastIndexOf('.');
		if (i >= 0) {
		    extension = download_nm.substring(i+1);
		}
		String file_nm = UUID.randomUUID().toString()+"."+extension; // file_name for upload
		String absolute_path = UPLOAD_DIR+file_path;
		
		File dir_path = new File(absolute_path);
		if(!dir_path.exists()) dir_path.mkdirs();
		
		File img_file = new File(absolute_path+file_nm);
		upload_file.transferTo(img_file); // 파일을 위에 지정 경로로 업로드
		
		BufferedImage bimg = ImageIO.read(img_file);
		int width          = bimg.getWidth();
		int height         = bimg.getHeight();	
		
		ImageVO imgVo = new ImageVO();
		imgVo.setFile_nm(file_nm);
		imgVo.setFile_path(file_path);
		imgVo.setFile_format(extension);
		imgVo.setFile_size(img_file.length());
		imgVo.setDownload_nm(download_nm);
		imgVo.setImg_width(width);
		imgVo.setImg_height(height);
		
		return imgVo;		
	}
}
