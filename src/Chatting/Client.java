package Chatting;

import java.io.*;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) {
        Socket socket  = new Socket();
        Scanner sc = new Scanner(System.in);

        InputStream is = null;
        InputStreamReader isr = null;
        BufferedReader br = null;

        OutputStream os = null;
        OutputStreamWriter osw = null;
        PrintWriter pw  = null;

        try {
            socket.connect(new InetSocketAddress(InetAddress.getLocalHost(),6077));
            System.out.println("[client] connected with server");

            while(true){
                is = socket.getInputStream();
                isr = new InputStreamReader(is,"UTF-8");
                br = new BufferedReader(isr);

                os = socket.getOutputStream();
                osw = new OutputStreamWriter(os, "UTF-8");
                pw = new PrintWriter(osw, true);

                System.out.print(">>");
                String data = sc.nextLine();

                if(data.equals("exit")){
                    break;
                }
                pw.println(data);
                data = br.readLine();
                System.out.println("<<[server] " + data);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(socket != null && !socket.isClosed())
                    socket.close();
            }catch (Exception e){
                e.printStackTrace();
            }
            sc.close();
        }


    }
}
