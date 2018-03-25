using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace BanHangDienTu.Helper
{
    public static class MD5Encryster
    {
        public static  string GetMD5(this string input)
        {
            MD5 md5 = MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] outputBytes = md5.ComputeHash(inputBytes);

            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < outputBytes.Length; i++)
            {
                sb.Append(outputBytes[i].ToString("x2"));
            }
            return sb.ToString();
        }
    }
}