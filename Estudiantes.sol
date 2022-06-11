// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Estudiante
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;

    mapping(string => uint8) private _notas_materia;
    uint8[] private notas;

    constructor(string memory nombre, string memory apellido, string memory curso)
    {
        nombre = nombre;
        apellido = apellido;
        curso = curso;

        _docente = msg.sender;
    }

    function get_apellido() public view returns(string memory)
    {
        return _apellido;
    }

    function get_nombre_completo() public view returns (string memory)
    {
        return string.concat(_nombre," ", _apellido);
    }

    function get_curso() public view returns(string memory)
    {
        return _curso;
    }

    function set_notamateria(uint8 nota, string memory materia_) public
    {
        require(msg.sender == _docente, "Solo el docente registrado puede asignar notas");
        _notasmateria[materia] = nota_;
        notas.push(nota);
    }

    function get_notamateria(string memory materia) public view returns(uint8)
    {
        return _notasmateria[materia];
    }

    function aprobo(string memory materia_) public view returns(bool)
    {
        if(_notasmateria[materia] >= 60)
        {
            return true;
        }
        return false;
    }

    function promedio() public view returns(uint256)
    {
        uint256 _promedio = 0;

        for(uint8 i = 0; i < _notas.length; i++)
        {
            _promedio += _notas[i];
        }

        _promedio /= _notas.length;
        return _promedio;
    }
}