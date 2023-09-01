// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function cambiarcategoria(id)
{
    let  categorias = document.getElementsByName("categoria");
    for(let i=0; i<categorias.length; i++)
    {
        categorias[i].style.backgroundColor = "#9aeaec";
    }
    document.getElementById("categoria_"+id).style.backgroundColor = "#1e5385";
}

function cambiardificultad(id)
{
    let  dificultades = document.getElementsByName("dificultad");
    for(let i=0; i<dificultades.length; i++)
    {
        dificultades[i].style.backgroundColor = "#9aeaec";
    }
    document.getElementById("dificultad_"+id).style.backgroundColor = "#1e5385";
}