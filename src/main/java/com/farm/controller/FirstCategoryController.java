package com.farm.controller;

import com.farm.pojo.Category;
import com.farm.pojo.FirstCategory;
import com.farm.pojo.Page;
import com.farm.service.FirstCategoryService;
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
public class FirstCategoryController {
    @Autowired
    FirstCategoryService firstCategoryService;

    @RequestMapping("admin_firstcategory_list")//管理员查询一级分类
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<FirstCategory> cs= firstCategoryService.list();
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs", cs);
        model.addAttribute("page", page);
        return "admin/listFirstCategory";
    }

    @RequestMapping("admin_firstcategory_add")//管理员添加一级分类
    public String add(FirstCategory c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        System.out.println(c.getId());
        firstCategoryService.add(c);
        System.out.println(c.getId());
        File imageFolder= new File(session.getServletContext().getRealPath("img/firstcategory"));
        File file = new File(imageFolder,c.getId()+".jpg");
        if(!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        System.out.println(uploadedImageFile);
        System.out.println(uploadedImageFile.getImage());
        System.out.println(file);
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);
        return "redirect:/admin_firstcategory_list";
    }

    @RequestMapping("admin_firstcategory_delete")//管理员删除一级分类
    public String delete(int id,HttpSession session) throws IOException {
        firstCategoryService.delete(id);
        File  imageFolder= new File(session.getServletContext().getRealPath("img/firstcategory"));
        File file = new File(imageFolder,id+".jpg");
        file.delete();
        return "redirect:/admin_firstcategory_list";
    }

    @RequestMapping("admin_firstcategory_edit")//管理员编辑一级分类
    public String get(int id,Model model) throws IOException{
        FirstCategory firstCategory=firstCategoryService.get(id);
        model.addAttribute("c",firstCategory);
        return "admin/editFirstCategory";
    }

    @RequestMapping("admin_firstcategory_update")//管理员修改一级分类
    public String update(FirstCategory c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
       firstCategoryService.update(c);
        MultipartFile image = uploadedImageFile.getImage();
        if(null!=image &&!image.isEmpty()){
            File  imageFolder= new File(session.getServletContext().getRealPath("img/firstcategory"));
            File file = new File(imageFolder,c.getId()+".jpg");
            image.transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }
        return "redirect:/admin_firstcategory_list";
    }

    @RequestMapping("fore_firstcategory_list")//用户查询一级分类
    public String listBack(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<FirstCategory> cs= firstCategoryService.list();
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs", cs);
        model.addAttribute("page", page);
        return "userBack/listFirstCategory";
    }
}
