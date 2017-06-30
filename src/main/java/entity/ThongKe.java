/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author TrungHieu
 */
public class ThongKe {

    private int SoLuongSanPham;
    private int SoLuongSanPhamHetHang;
    private int SoLuongSanPhamDaDuyet;

    private int SoLuongUser;
    private int SoLuongShop;

    private int SoLuongDonHang;
    private int SoLuongSanPhamDonHang;
    private int SoLuongSanPhamDaBan;

    private float DoanThu;

    public ThongKe(int SoLuongSanPham, int SoLuongSanPhamHetHang, int SoLuongSanPhamDaDuyet, int SoLuongUser, int SoLuongShop, int SoLuongDonHang, int SoLuongSanPhamDonHang, int SoLuongSanPhamDaBan, float DoanThu) {
        this.SoLuongSanPham = SoLuongSanPham;
        this.SoLuongSanPhamHetHang = SoLuongSanPhamHetHang;
        this.SoLuongSanPhamDaDuyet = SoLuongSanPhamDaDuyet;
        this.SoLuongUser = SoLuongUser;
        this.SoLuongShop = SoLuongShop;
        this.SoLuongDonHang = SoLuongDonHang;
        this.SoLuongSanPhamDonHang = SoLuongSanPhamDonHang;
        this.SoLuongSanPhamDaBan = SoLuongSanPhamDaBan;
        this.DoanThu = DoanThu;
    }

    public ThongKe() {
    }
       

    public int getSoLuongSanPham() {
        return SoLuongSanPham;
    }

    public int getSoLuongSanPhamHetHang() {
        return SoLuongSanPhamHetHang;
    }

    public int getSoLuongSanPhamDaDuyet() {
        return SoLuongSanPhamDaDuyet;
    }

    public int getSoLuongUser() {
        return SoLuongUser;
    }

    public int getSoLuongShop() {
        return SoLuongShop;
    }

    public int getSoLuongDonHang() {
        return SoLuongDonHang;
    }

    public int getSoLuongSanPhamDonHang() {
        return SoLuongSanPhamDonHang;
    }

    public int getSoLuongSanPhamDaBan() {
        return SoLuongSanPhamDaBan;
    }

    public float getDoanThu() {
        return DoanThu;
    }

    public void setSoLuongSanPham(int SoLuongSanPham) {
        this.SoLuongSanPham = SoLuongSanPham;
    }

    public void setSoLuongSanPhamHetHang(int SoLuongSanPhamHetHang) {
        this.SoLuongSanPhamHetHang = SoLuongSanPhamHetHang;
    }

    public void setSoLuongSanPhamDaDuyet(int SoLuongSanPhamDaDuyet) {
        this.SoLuongSanPhamDaDuyet = SoLuongSanPhamDaDuyet;
    }

    public void setSoLuongUser(int SoLuongUser) {
        this.SoLuongUser = SoLuongUser;
    }

    public void setSoLuongShop(int SoLuongShop) {
        this.SoLuongShop = SoLuongShop;
    }

    public void setSoLuongDonHang(int SoLuongDonHang) {
        this.SoLuongDonHang = SoLuongDonHang;
    }

    public void setSoLuongSanPhamDonHang(int SoLuongSanPhamDonHang) {
        this.SoLuongSanPhamDonHang = SoLuongSanPhamDonHang;
    }

    public void setSoLuongSanPhamDaBan(int SoLuongSanPhamDaBan) {
        this.SoLuongSanPhamDaBan = SoLuongSanPhamDaBan;
    }

    public void setDoanThu(float DoanThu) {
        this.DoanThu = DoanThu;
    }

    
}
