* clone with 

  ```
  git clone https://github.com/fvisin/home.git
  ```

or

  ```
  git clone git@github.com:fvisin/home.git
  ```

* `cd home`

* move every file to parent directory with: 
  ```
  find . -mindepth 1 -maxdepth 1 -exec mv -t.. -- {} +
  ```

* remove home with: `cd ..; rm -r ~/home`
