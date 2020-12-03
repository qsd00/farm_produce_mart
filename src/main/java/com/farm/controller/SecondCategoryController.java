package com.farm.controller;

import com.farm.pojo.Category;
import com.farm.pojo.FirstCategory;
import com.farm.pojo.Page;
import com.farm.pojo.SecondCategory;
import com.farm.service.FirstCategoryService;
import com.farm.service.SecondCategoryService;
import com.farm.util.ImageUtil;
import com.farm.util.UploadedImageFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class SecondCategoryController {
    @Autowired
    FirstCategoryService firstCategoryService;

    @Autowired
    SecondCategoryService secondCategoryService;

    @RequestMapping("admin_secondcategory_list")//管理员查询二级分类
    public String list(Model model, int fid, Page page){
        FirstCategory fc=firstCategoryService.get(fid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<SecondCategory> cs= secondCategoryService.list(fid);
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        page.setParam("&fid="+fc.getId());
        model.addAttribute("cs", cs);
        model.addAttribute("fc", fc);
        model.addAttribute("page", page);
        return "admin/listSecondCategory";
    }

    @RequestMapping("admin_secondcategory_add")//管理员添加二级分类
    public String add(SecondCategory c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        System.out.println(c.getId());
        secondCategoryService.add(c);
        System.out.println(c.getId());
        File imageFolder= new File(session.getServletContext().getRealPath("img/secondcategory"));
        File file = new File(imageFolder,c.getId()+".jpg");
        if(!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        System.out.println(uploadedImageFile);
        System.out.println(uploadedImageFile.getImage());
        System.out.println(file);
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);
        return "redirect:/admin_secondcategory_list?fid="+c.getFid();
    }

    @RequestMapping("admin_secondcategory_delete")//管理员删除二级分类
    public String delete(int id,HttpSession session) throws IOException {
        SecondCategory sc=secondCategoryService.get(id);
        secondCategoryService.delete(id);
        File  imageFolder= new File(session.getServletContext().getRealPath("img/secondcategory"));
        File file = new File(imageFolder,id+".jpg");
        file.delete();
        return "redirect:/admin_secondcategory_list?fid="+sc.getFid();
    }

    @RequestMapping("admin_secondcategory_edit")//管理员编辑二级分类
    public String get(int id,Model model) throws IOException{
        SecondCategory secondCategory=secondCategoryService.get(id);
        model.addAttribute("c",secondCategory);
        return "admin/editSecondCategory";
    }

    @RequestMapping("admin_secondcategory_update")//管理员修改二级分类
    public String update(SecondCategory c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        secondCategoryService.update(c);
        MultipartFile image = uploadedImageFile.getImage();
        if(null!=image &&!image.isEmpty()){
            File  imageFolder= new File(session.getServletContext().getRealPath("img/secondcategory"));
            File file = new File(imageFolder,c.getId()+".jpg");
            image.transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }
        return "redirect:/admin_secondcategory_list?fid="+c.getFid();
    }

    @RequestMapping("userBack_secondcategory_list")//用户查询二级分类
    public String listBack(Model model, int fid, Page page){
        FirstCategory fc=firstCategoryService.get(fid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<SecondCategory> cs= secondCategoryService.list(fid);
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        page.setParam("&fid="+fc.getId());
        model.addAttribute("cs", cs);
        model.addAttribute("fc", fc);
        model.addAttribute("page", page);
        return "userBack/listSecondCategory";
    }

}
